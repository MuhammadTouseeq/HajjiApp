import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hajjiapp/presentarion/sections_screen/models/sections_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/deal_model.dart';
import '../../../core/model_classes/login_model.dart';
import '../../../core/model_classes/page_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/cupertino_alert_dialog.dart';
import '../../../widgets/paginations/paged_view.dart';

/// A controller class for the DiscoverScreen.
///
/// This class manages the state of the DiscoverScreen, including the
/// current discoverModelObj
///
class DashboardController extends GetxController {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController btn1Controller =
      RoundedLoadingButtonController();
  // Rx<DiscoverModel> discoverModelObj = DiscoverModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  // AppPreferences appPreferences = AppPreferences();
  LoginModel? userDetails;
  RxBool isLoading = true.obs;
  AppPreferences appPreferences = AppPreferences();


  Future<void> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data = await _appPreferences.getProfileData();
    if (data != null) {
      Map<String, dynamic> userMap = jsonDecode(data);
      userDetails = LoginModel.fromJson(userMap);
    }
    isLoading.value = false;

    UpdateDeviceToken();
  }

  final Rx<BedData?> myReserveBed = Rx<BedData?>(null);

  void logoutConfirmation(BuildContext context) async {
    showDialog(
        context: context,
        builder: (ct) {
          return CustomAlertDialog(
            title: "Log Out".tr,
            content: "Are you sure want to Logout?".tr,
            firstButtonContent: "Yes".tr,
            secondButtonContent: "No".tr,
            first: () async {
              // Get.offAllNamed(AppRoutes.loginScreen);
              // logout();
              await _appPreferences.getAppPreferences().isPreferenceReady;
              await _appPreferences.getAppPreferences().clearPreference();

              Get.offAllNamed(AppRoutes.loginPage);
            },
            second: () {
              Get.back();
            },
          );
        });
  }

  // Future<dynamic> getProfileData() async {
  //   await _appPreferences.isPreferenceReady;
  //   var data= await _appPreferences.getProfileData();
  //   Map<String,dynamic> userMap = jsonDecode(data!);
  //   print('map $userMap');
  //
  //   userDetails = LoginModel.fromJson(userMap);
  //   print('map1 $userDetails');
  // }

  Future<void> CheckMyreserveBed() async {
    Utils.check().then((value) async {
      if (value) {
        await BaseClient.post(Constants.bedDataUrl,
            onSuccess: (response) async {
          // apiCallStatus = ApiCallStatus.success;
          List<BedData> dataBeds = [];
          print("Bed Api response========  ${response.data['data']}");
          if (response.data['status'] == true) {
            // clear();
            // mapURL.value = response.data['reservation_map'] ;
            // print("maping url========  ${mapURL.value}");

            response.data['data'].forEach((v) {
              dataBeds.add(new BedData.fromJson(v));
            });

            if (dataBeds != null) {
              myReserveBed.value = dataBeds[0];
              print("Reserve Bed ========  ${dataBeds[0]}");
            }
          } else {
            Utils.showToast('', true);
            // Handle the case where data is null in the response
          }
        }, onError: (error) {
          BaseClient.handleApiError(error);
          // apiCallStatus = ApiCallStatus.error;
        }, data: {
          "user_id": userDetails?.userId,
          "reserved_by_user_id": userDetails?.userId,
          "session_code": userDetails?.sessionCode,
        });
      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });
  }

  Future<void> UpdateDeviceToken() async {


    Utils.check().then((value) async {
      if (value) {
        await appPreferences.isPreferenceReady;
        appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          print("DeviceToken $token");
          await BaseClient.post(Constants.deviceToken,
              onSuccess: (response) async {

              }, onError: (error) {
                BaseClient.handleApiError(error);
                // apiCallStatus = ApiCallStatus.error;
              }, data: {
                "user_id": userDetails?.userId,
                'device_type': (Platform.isIOS) ? 'ios' : 'android',
                "session_code": userDetails?.sessionCode,
                'device_token': token
              });
        });
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
    CheckMyreserveBed();

  }
}
