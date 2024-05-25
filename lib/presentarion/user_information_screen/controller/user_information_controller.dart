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
class UserInformationController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  TextEditingController emailController = TextEditingController(text: 'sharjeelahmed92@hotmail.com');

  TextEditingController phoneNumber = TextEditingController();
  Rx<bool> isShowPassword = false.obs;
  RxBool isValidate = false.obs;
  RxString phoneNo = "".obs;
  PhoneNumber initialPhone = PhoneNumber(isoCode: 'PK');
  GlobalKey<FormState> formKey = new GlobalKey();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  AppPreferences appPreferences = AppPreferences();

  String generateGuestToken() {
    // Generate a placeholder or generic token for the guest user
    return 'guest_token';
  }

  Future<void> UserApi(context) async {
    final formState = formKey.currentState;
    if (formState!.validate()) {
      Utils.check().then((value) async {
        if (value) {
          btnController.start();
          await BaseClient.post(
              Constants.userUrl,
              onSuccess: (response) async {
                btnController.stop();
                apiCallStatus = ApiCallStatus.success;

                if (response.data['data'] != null) {
                  LoginModel loginResponseModel = LoginModel.fromJson(response.data['data']);
                  print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');

                  _appPreferences.setIsLoggedIn(loggedIn: true);
                 //  _appPreferences.setAccessToken(token: loginResponseModel.sessionCode!);
                  _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));

                  await _appPreferences.isPreferenceReady;

                  Utils.showToast(response.data['message'], false,);
                  print("masg  ${response.data['message']}");
                   Get.toNamed(AppRoutes.otpPage);
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
                'user_id': 2,
                'email_id': emailController.text,
                'phone_number': phoneNumber.text,
                //'phone_number': phoneNumber.text,
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

  var selectedValue = false.obs;

  void setSelectedValue(bool value) {
    selectedValue.value = value;
  }









  @override
  void onClose() {
    super.onClose();

  }
}
