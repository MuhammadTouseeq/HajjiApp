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
import '../../user_information_screen/controller/user_information_controller.dart';

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
  String phoneNumber =Get.find<UserInformationController>().phoneNumber.text;

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
  Rx<int> start = 60.obs;
  Rx<Duration> myDuration = Duration(seconds: 60).obs;
  LoginModel? userDetails;
  Rx<String> email = "".obs;

  Timer? countdownTimer;

  String generateGuestToken() {
    // Generate a placeholder or generic token for the guest user
    return 'guest_token';
  }

  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('map $userMap');

    userDetails = LoginModel.fromJson(userMap);
    print('map1 $userDetails');
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
    myDuration.value = Duration(seconds: 60);
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
          print(response.data); // i done successfully

          LoginModel loginResponseModel = LoginModel.fromJson(response.data['data']);
          print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');

          Utils.showToast(response.data['message'], false);

          await _appPreferences.isPreferenceReady;

         // _appPreferences.setAccessToken(token: loginResponseModel.token!);
          _appPreferences.setProfileData(data: jsonEncode(loginResponseModel));

          if (response.data['status']) {
            apiCallStatus = ApiCallStatus.success;
            // update();
            _appPreferences.setAccessToken(
                token: loginResponseModel!.sessionCode!);
            _appPreferences.setIsLoggedIn(loggedIn: true);
            Utils.showToast("${response.data['message']}", true);

            Get.offAllNamed(AppRoutes.dashboradPage);

          }
            else
              {
                Utils.showToast("${response.data['message']}", true);

              }
        },
        onError: (error) {
          BaseClient.handleApiError(error);

          apiCallStatus = ApiCallStatus.error;
          // update();
        },
        data: {
          'user_id': userDetails!.userId,
          'otp': otpController.text,
          'token': userDetails!.token,
        }
    );
  }

  Future<void> resendApi(context) async {
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
                await _appPreferences.isPreferenceReady;
                Utils.showToast(response.data['message'], false);
                print("msg ${response.data['message']}");
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
            'email_id': userDetails!.emailId,
            'phone_number': userDetails!.phoneNumber,
            'token': userDetails!.token,
          },
        );
      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });
  }





  @override
  Future<void> onInit() async {
    getProfileData();
    startTimer();
    phoneNumber = Get.arguments['phonenumber'];

   // startTimer();
    super.onInit();
  }



  @override
  void onClose() {
    super.onClose();

  }
}
