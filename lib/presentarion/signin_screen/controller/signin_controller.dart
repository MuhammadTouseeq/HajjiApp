import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/login_model.dart';
import '../../../core/model_classes/manager_login_model.dart';
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
class SignInController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController btnsignupController = RoundedLoadingButtonController();
  TextEditingController emailController = TextEditingController(text: 'test_ogm_1');
  TextEditingController passController = TextEditingController(text: 'Karachi@123');


  Rx<bool> isShowPassword = false.obs;
  RxBool isValidate = false.obs;
  RxString phoneNo = "".obs;
  PhoneNumber initialPhone = PhoneNumber(isoCode: 'PK');
  GlobalKey<FormState> formKey = new GlobalKey();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  LoginModel? userDetails;



  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('map $userMap');

    userDetails = LoginModel.fromJson(userMap);
    print('map1 $userDetails');
  }



  // Future<void> managerLoginAPI(context) async {
  //   final formState = formKey.currentState;
  //   if (formState!.validate()) {
  //     Utils.check().then((value) async {
  //       if (value) {
  //         btnController.start();
  //         await BaseClient.post(
  //             Constants.managerLoginUrl,
  //             onSuccess: (response) async {
  //               btnController.stop();
  //               apiCallStatus = ApiCallStatus.success;
  //
  //               if (response.data['data'] != null) {
  //                 ManagerLoginModel loginResponseModel = ManagerLoginModel.fromJson(response.data['data']);
  //                 print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');
  //
  //
  //
  //
  //                 await _appPreferences.isPreferenceReady;
  //                 _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));
  //
  //                 Utils.showToast(response.data['message'], false,);
  //                 print(response.data['message']);
  //                  Get.toNamed(AppRoutes.hajjiAttendancePage);
  //               } else {
  //                 Utils.showToast('Incorrect Password or Email', true);
  //                 // Handle the case where data is null in the response
  //               }
  //             },
  //             onError: (error) {
  //               BaseClient.handleApiError(error);
  //               btnController.stop();
  //               apiCallStatus = ApiCallStatus.error;
  //             },
  //             data: {
  //               // 'device_id': '12345Testing1',
  //               'device_type': (Platform.isIOS) ? 'ios' : 'android',
  //               'user_name': emailController.text,
  //               'user_password': passController.text,
  //             }
  //         );
  //
  //       } else {
  //         CustomSnackBar.showCustomErrorToast(
  //           message: Strings.noInternetConnection.tr,
  //         );
  //       }
  //     });
  //   } else {
  //     print("Form validation failed");
  //   }
  // }

  Future<void> managerLoginAPI(BuildContext context) async {
    final formState = formKey.currentState;

    // Validate the form
    if (formState!.validate()) {
      // Check internet connection
      Utils.check().then((value) async {
        if (value) {
          // Start button loading animation
          btnController.start();

          // Make the API call
          await BaseClient.post(
            Constants.managerLoginUrl,
            onSuccess: (response) async {
              // Stop button loading animation
              btnController.stop();
              apiCallStatus = ApiCallStatus.success;

              if (response.data['data'] != null) {
                // Parse the response
                ManagerLoginModel loginResponseModel = ManagerLoginModel.fromJson(response.data['data']);
                print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');

                // Save profile data
                await _appPreferences.isPreferenceReady;
                _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));

                // Show success toast
                Utils.showToast(response.data['message'], false);
                print(response.data['message']);

                // Navigate to the next screen
                Get.toNamed(AppRoutes.eventSelectionPage);
              } else {
                // Show error toast if data is null
                Utils.showToast('Incorrect Password or Email', true);
              }
            },
            onError: (error) {
              // Handle API error
              BaseClient.handleApiError(error);
              btnController.stop();
              apiCallStatus = ApiCallStatus.error;

              // Show error toast
              Utils.showToast('Login failed, please try again', true);
            },
            data: {
              'device_type': (Platform.isIOS) ? 'ios' : 'android',
              'user_name': emailController.text,
              'user_password': passController.text,
            },
          );
        } else {
          // Show no internet connection error toast
          CustomSnackBar.showCustomErrorToast(
            message: Strings.noInternetConnection.tr,
          );
        }
      });
    } else {
      print("Form validation failed");
      // Optionally show a toast or snackbar for form validation failure
      Utils.showToast("Form validation failed", true);
    }
  }



  var selectedValue = false.obs;

  void setSelectedValue(bool value) {
    selectedValue.value = value;
  }


  @override
  void onInit() {
    super.onInit();
    // getProfileData();

  }









  @override
  void onClose() {
    super.onClose();

  }
}