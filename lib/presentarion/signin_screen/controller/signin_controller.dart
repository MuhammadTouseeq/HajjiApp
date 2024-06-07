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
class SignInController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController btnsignupController = RoundedLoadingButtonController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  Rx<bool> isShowPassword = false.obs;
  RxBool isValidate = false.obs;
  RxString phoneNo = "".obs;
  PhoneNumber initialPhone = PhoneNumber(isoCode: 'PK');
  GlobalKey<FormState> formKey = new GlobalKey();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  LoginModel? userDetails;
  void sendPhoneNumber() {
    String fullPhoneNumber = phoneNo.value;
    // Code to send the phone number to your backend or another service
    print("Sending phone number: $fullPhoneNumber");
  }


  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('map $userMap');

    userDetails = LoginModel.fromJson(userMap);
    print('map1 $userDetails');
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
                  print('[ otp RESPONSE ===> ${loginResponseModel.toJson()}]');

                  if (loginResponseModel.status == '1') {
                    // _appPreferences.setIsLoggedIn(loggedIn: true);
                    //   _appPreferences.setAccessToken(token: loginResponseModel.token!);
                    // _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));

                    await _appPreferences.isPreferenceReady;

                    Utils.showToast(response.data['message'], false);
                    print("msg ${response.data['message']}");
                    Get.toNamed(AppRoutes.otpPage);
                  } else {
                    Utils.showToast("${response.data['message']}", true);
                  }
                } else {
                  Utils.showToast('', true);
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
                'email_id': "",//emailController.text
                //'phone_number': phoneNumber.text,
                'phone_number': phoneNo.value,
                'token': userDetails!.token,
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
  void onInit() {
    super.onInit();
    // getProfileData();

  }









  @override
  void onClose() {
    super.onClose();

  }
}