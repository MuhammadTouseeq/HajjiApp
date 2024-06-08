import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hajjiapp/core/model_classes/manager_login_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/deal_model.dart';
import '../../../core/model_classes/login_model.dart';
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
class ScanCodeController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  var scannedCode = ''.obs;
  GlobalKey<FormState> formKey = new GlobalKey();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  ManagerLoginModel? userDetails;

  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('map $userMap');

    userDetails = ManagerLoginModel.fromJson(userMap);
    print('map1 $userDetails');
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

  Future<void> managerLoginAPI(context, String haajiId) async {
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
              'event_id': "1",
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
    getProfileData();



  }


}
