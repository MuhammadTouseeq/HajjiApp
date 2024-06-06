import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
import '../../../routes/app_routes.dart';
import '../../../widgets/cupertino_alert_dialog.dart';
import '../../../widgets/paginations/paged_view.dart';

/// A controller class for the DiscoverScreen.
///
/// This class manages the state of the DiscoverScreen, including the
/// current discoverModelObj
///
class DashboardController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController btn1Controller = RoundedLoadingButtonController();

  AppPreferences _appPreferences = AppPreferences();
  LoginModel? userDetails;
  RxBool isLoading = true.obs;
  Future<void> getProfileData() async {
    // Simulating data fetching delay
    await Future.delayed(Duration(seconds: 1));


    userDetails = LoginModel(
       userId: "1",
      haajiName: "test",
      haajiId: "321",
      phoneNumber: "+923111888909",
      sessionCode: "48a953d604d7dc4c0ceff2b1ce43a9"
    );

    isLoading.value = false;
  }
  // Future<void> getProfileData() async {
  //   await _appPreferences.isPreferenceReady;
  //   var data = await _appPreferences.getProfileData();
  //   if (data != null) {
  //     Map<String, dynamic> userMap = jsonDecode(data);
  //     userDetails = LoginModel.fromJson(userMap);
  //   }
  //   isLoading.value = false;
  // }

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
              await _appPreferences
                  .getAppPreferences()
                  .isPreferenceReady;
              await _appPreferences.getAppPreferences()
                  .clearPreference();

              Get.offAllNamed(AppRoutes.signInPage);

            },
            second: () {
              Get.back();
            },
          );
        });
  }








  @override
  void onInit() {
    super.onInit();
    getProfileData();

  }


}
