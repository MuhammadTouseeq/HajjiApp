import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hajjiapp/core/model_classes/events_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/deal_model.dart';
import '../../../core/model_classes/events_details_model.dart';
import '../../../core/model_classes/login_model.dart';
import '../../../core/model_classes/manager_login_model.dart';
import '../../../core/model_classes/page_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../localization/strings_enum.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/paginations/paged_view.dart';

/// A controller class for the DiscoverScreen.
///
/// This class manages the state of the DiscoverScreen, including the
/// current discoverModelObj
///
class HajjiAttendanceController extends GetxController with GetSingleTickerProviderStateMixin {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  RxInt tabChange = 0.obs;
  var scannedCode = ''.obs;
  TextEditingController hajjiIdController = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey();
  late TabController tabsController =
  Get.put(TabController(vsync: this, length: 2,initialIndex: tabChange.value));
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  var eventDetails = EventsDetailsModel().obs;
  var isLoading = true.obs;
  ManagerLoginModel? userDetails;
  Events? eventsId;
  RxBool isInternetAvailable = true.obs;

  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('manager $userMap');

    userDetails = ManagerLoginModel.fromJson(userMap);
    getEventsDetailsApi();
    print('manaager $userDetails');
  }

  Future<void> getEventsDetailsApi() async {
    try {
      bool isInternetAvailable = await Utils.check();
      if (!isInternetAvailable) {
        // Handle no internet scenario
        isLoading.value = false; // Update loading state
        return;
      }

      // Perform API call
      apiCallStatus = ApiCallStatus.loading;

      var response = await BaseClient.get(
        'https://haaji.website/events/details?user_id=${userDetails!.userId}&session_code=${userDetails!.sessionCode}&event_id=${eventsId!.eventId}',
        // Replace with your URL and parameters
        onSuccess: (response) {
          EventsDetailsModel eventsResponse = EventsDetailsModel.fromJson(response.data['data']);
          eventDetails.value = eventsResponse; // Update event details in controller
          apiCallStatus = ApiCallStatus.success; // Update API status
          isLoading.value = false; // Update loading state
        },
        onError: (error) {
          ApiException apiException = error;
          print(apiException.message);
          BaseClient.handleApiError(error); // Handle API error
          apiCallStatus = ApiCallStatus.error; // Update API status
          isLoading.value = false; // Update loading state
        },
        queryParameters: null,
      );

      // Handle response outside onSuccess (if needed)

    } catch (e) {
      print('Exception during API call: $e');
      apiCallStatus = ApiCallStatus.error; // Update API status
      isLoading.value = false; // Update loading state
      // Handle exception as needed
    }
  }





  Future<String> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      if (barcodeScanRes != '-1') {
        scannedCode.value = barcodeScanRes;
        return barcodeScanRes;
      } else {
        scannedCode.value = 'Scan cancelled';
        return 'Scan cancelled';
      }
    } catch (e) {
      scannedCode.value = 'Error: $e';
      return 'Error: $e';
    }
  }

  Future<void> managermanualAPI() async {
    Utils.check().then((value) async {
      if (value) {
        btnController.start();
        await BaseClient.post(
            Constants.attendanceUrl,
            onSuccess: (response) async {
              btnController.stop();
              apiCallStatus = ApiCallStatus.success;

              if (response.data['data'] != null) {
                ManagerLoginModel loginResponseModel = ManagerLoginModel.fromJson(response.data['data']);
                print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');

                await _appPreferences.isPreferenceReady;

                Utils.showToast(response.data['message'], false);
                print(response.data['message']);

                getEventsDetailsApi();
                // Get.toNamed(AppRoutes.homeOneScreen);
              } else {
                Utils.showToast('Incorrect Password or Email', true);
                // Handle the case where data is null in the response
              }
            },
            onError: (error) {
              BaseClient.handleApiError(error);
              btnController.stop();
              apiCallStatus = ApiCallStatus.error;
            },
            data: {
              'device_type': (Platform.isIOS) ? 'ios' : 'android',
              'user_id': userDetails!.userId,
              'session_code': userDetails!.sessionCode,
              'haaji_id': hajjiIdController.text,
              'event_id': eventsId!.eventId,
            }
        );
      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });
  }

  Future<void> managerScanAPI(String haajiId) async {
    Utils.check().then((value) async {
      if (value) {
        btnController.start();
        await BaseClient.post(
            Constants.attendanceUrl,
            onSuccess: (response) async {
              btnController.stop();
              apiCallStatus = ApiCallStatus.success;

              if (response.data['data'] != null) {
                ManagerLoginModel loginResponseModel = ManagerLoginModel.fromJson(response.data['data']);
                print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');

                await _appPreferences.isPreferenceReady;

                Utils.showToast(response.data['message'], false);
                print(response.data['message']);
                getEventsDetailsApi();
                // Get.toNamed(AppRoutes.homeOneScreen);
              } else {
                Utils.showToast('Incorrect Password or Email', true);
                // Handle the case where data is null in the response
              }
            },
            onError: (error) {
              BaseClient.handleApiError(error);
              btnController.stop();
              apiCallStatus = ApiCallStatus.error;
            },
            data: {
              'device_type': (Platform.isIOS) ? 'ios' : 'android',
              'user_id': userDetails!.userId,
              'session_code': userDetails!.sessionCode,
              'haaji_id': scannedCode.value,
              'event_id': eventsId!.eventId,
            }
        );
      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    eventsId = Get.arguments['eventId'];
    print('event id ${eventsId!.eventId}');
    getProfileData();
    getEventsDetailsApi();



  }


}

class ApiService {
  final Dio _dio = Dio();

  Future<EventsDetailsModel?> fetchEventDetails(ManagerLoginModel userDetails,String eventId) async {
    try {
      final response = await _dio.get(
          'https://haaji.website/events/details?user_id=${userDetails!.userId}&session_code=${userDetails.sessionCode}&event_id=$eventId'
      );
      if (response.statusCode == 200) {
        return EventsDetailsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load event details');
      }
    } catch (e) {
      print(e);
      throw e; // Ensure error is propagated
    }
  }
}