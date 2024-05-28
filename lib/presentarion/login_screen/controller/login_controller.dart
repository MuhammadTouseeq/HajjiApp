import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/login_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../localization/strings_enum.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_snackbar.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  TextEditingController hajjIdController = TextEditingController(text: "test");

  TextEditingController passwordController = TextEditingController();
  Rx<bool> isShowPassword = false.obs;
  GlobalKey<FormState> formKey = new GlobalKey();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  AppPreferences appPreferences = AppPreferences();

  String generateGuestToken() {
    // Generate a placeholder or generic token for the guest user
    return 'guest_token';
  }

  var selectedValue = false.obs;

  void setSelectedValue(bool value) {
    selectedValue.value = value;
  }


  Future<void> loginAPI(context) async {
    final formState = formKey.currentState;
    if (formState!.validate()) {
      Utils.check().then((value) async {
        if (value) {
          btnController.start();
          await BaseClient.post(
              Constants.loginUrl,
              onSuccess: (response) async {
                btnController.stop();
                apiCallStatus = ApiCallStatus.success;

                if (response.data['data'] != null) {
                  LoginModel loginResponseModel = LoginModel.fromJson(response.data['data']);
                  print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');
                  print('[ LOGIN dev ===> ${response.data['data']}]');
                  print('[ LOGIN dev1 ===> ${response.data}]');

                  _appPreferences.setIsLoggedIn(loggedIn: true);
                  _appPreferences.setAccessToken(token: loginResponseModel!.token!);
                  _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));

                  await _appPreferences.isPreferenceReady;

                  Utils.showToast(response.data['message'], false,);
                  print("masg ${response.data['message']}");
                  Get.toNamed(AppRoutes.userInformationPage);
                } else {
                  Utils.showToast('', true);
                  // Handle the case where data is null in the response
                }
              },
              onError: (error) {
                BaseClient.handleApiError(error);
                btnController.stop();
                apiCallStatus = ApiCallStatus.error;
              },
              data: {
                // 'device_id': '12345Testing1',
                'device_type': (Platform.isIOS) ? 'ios' : 'android',
                'haaji_id': hajjIdController.text,
              }
          );

        } else {
          CustomSnackBar.showCustomErrorToast(
            message: Strings.noInternetConnection.tr,
          );
        }
      });
    } else {
      print("Form validation failed");
    }
  }


  // Future<void> deleteAPI(context) async {
  //   final formState = formKey.currentState;
  //   if (formState!.validate()) {
  //     Utils.check().then((value) async {
  //       if (value) {
  //         btnController.start();
  //         await BaseClient.post(
  //             Constants.loginUrl,
  //             onSuccess: (response) async {
  //
  //               btnController.stop();
  //               apiCallStatus = ApiCallStatus.success;
  //
  //               LoginModel loginResponseModel = LoginModel.fromJson(response.data['data']);
  //               print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');
  //               // add karwaun yahan par beckend sy?
  //               // han sahii sahi mai bolta usko phr hujaega kam?
  //               // aik aur option hai get user ki profile api kaha pe hai ?
  //               // ye api nhi hai apapii call kro waha acha get ki api chalaun or onit pr data get krlun>
  //               // han agr backend wala mana krae to ye kam b kr sakte ho nhi to login k respons eme image data addk rwao ok bye
  //               // bhai
  //               //ek cheez or
  //               _appPreferences.setIsLoggedIn(loggedIn: true);
  //               _appPreferences.setAccessToken(token: loginResponseModel!.apiToken!);
  //               _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));
  //
  //               await _appPreferences.isPreferenceReady;
  //
  //
  //               Utils.showToast(response.data['message'], false);
  //               //Get.toNamed(AppRoutes.homeOneScreen);
  //               //  Get.offAllNamed(AppRoutes.homePageScreen);
  //
  //             },
  //             onError: (error) {
  //               BaseClient.handleApiError(error);
  //               btnController.stop();
  //               apiCallStatus = ApiCallStatus.error;
  //             },
  //             data: {
  //               // 'device_id': '12345Testing1',
  //               'device_type': (Platform.isIOS) ? 'ios' : 'android',
  //               'email': emailController.text,
  //               'password': passwordController.text,
  //             }
  //         );
  //
  //       } else {
  //         CustomSnackBar.showCustomErrorToast(
  //             message: Strings.noInternetConnection.tr);
  //       }
  //     });
  //   }
  //   else {
  //     print("object");
  //   }
  // }



  @override
  void onClose() {
    super.onClose();

  }
}
