import 'dart:async';
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
import '../../../widgets/custom_toast.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class OtpController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  TextEditingController otpController = TextEditingController();
  //final TextEditingController otpController = TextEditingController();
  final String phone = "+92 22222222222";
  String get expiryTime => "5 minutes"; // Example expiry time

  TextEditingController passwordController = TextEditingController();
  Rx<bool> isShowPassword = false.obs;
  GlobalKey<FormState> formKey = new GlobalKey();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  AppPreferences _appPreferences = AppPreferences();
  AppPreferences appPreferences = AppPreferences();
  Rx<String>? otpCode = "".obs;
  RxInt min = 01.obs;
  RxInt sec = 59.obs;
  RxBool resendOtpBool = false.obs;
  Rx<int> start = 120.obs;
  Rx<Duration> myDuration = Duration(seconds: 119).obs;

  Rx<String> email = "".obs;

  Timer? countdownTimer;

  String generateGuestToken() {
    // Generate a placeholder or generic token for the guest user
    return 'guest_token';
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void resetTimer() {
    stopTimer();
    myDuration.value = Duration(seconds: 119);
    startTimer();
  }
  void setCountDown() {
    final reduceSecondsBy = 1;

    final seconds = myDuration.value.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration.value = Duration(seconds: seconds);
    }
  }
  void reset()
  {
    min.value= 0;
    sec.value = 59;
    // countDown();
  }
  void countDown() {

    print(sec.value);
    if(min.value != 0){
      Timer.periodic(Duration(seconds: 1), (timer) {
        if(sec !=0){
          sec = sec - 1;
          print(sec.value);

        }else{
          if(min != 0){
            sec.value = 59;
            min--;
            print(sec.value);
          }else{
            timer.cancel();
          }
        }
      });
    }else{
      min = 01.obs;
      sec = 59.obs;
      countDown();
    }
  }





  Future<dynamic> verifyOtpApi() async {
    await BaseClient.post(
        Constants.otpVerifyUrl, // url
        onSuccess: (response) async { // ap
          print(response.data);// i done successfully

          LoginModel loginResponseModel = LoginModel.fromJson(response.data['data']);
          print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');

          Utils.showToast(response.data['message'], false);


          await _appPreferences.isPreferenceReady;

         // _appPreferences.setAccessToken(token: loginResponseModel.sessionCode!);
          _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));

          apiCallStatus = ApiCallStatus.success;
          update();

          _appPreferences.setIsLoggedIn(loggedIn: true);
          Get.offAllNamed(AppRoutes.loginPage);
        },
        onError: (error){

          BaseClient.handleApiError(error);

          apiCallStatus = ApiCallStatus.error;
          update();
        },

        data: {
          'user_id': 2,
          'otp': otpController.text,
        }// error while performing request
    );

  }









  @override
  void onClose() {
    super.onClose();

  }
}
