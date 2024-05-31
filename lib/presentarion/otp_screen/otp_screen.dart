import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../baseviews/baseview_auth_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../data/services/api_call_status.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/animated_custom_button.dart';
import '../../widgets/app_bar/custom_multitext.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_radio_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/otp_controller.dart';
//check commit
// ignore_for_file: must_be_immutable
class OtpScreen extends GetWidget<OtpController> {
  final selectedOption = RxBool(false);
  OtpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    return BaseviewAuthScreen(
      image: true,
      imageShown: ImageConstant.backgroundImage,
      child: Form(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getVerticalSize(50)),
                  GestureDetector(
                    onTap: () {
                      // Handle cancel action
                    },
                    child: Icon(Icons.arrow_back,color: ColorConstant.black900,)
                  ),
                  SizedBox(height: getVerticalSize(10)),
                  MyText(
                    title: "OTP\nVerification",
                    clr: ColorConstant.black900,
                    fontSize: 35,
                    customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "We have sent the code verification to ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: controller.phoneNumber,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getVerticalSize(100)),
                  Center(
                    child: PinCodeTextField(
                      key: controller.formKey,
                      controller: controller.otpController,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      pinBoxRadius: 50,
                      defaultBorderColor: ColorConstant.whiteA700,
                      pinBoxHeight: 50,
                      pinBoxWidth: 50,
                      onTextChanged: (text) {
                      },
                      onDone: (text) {
                        HelperFunction.otpValidate(text!);
                      },
                      // Adjust other properties as needed
                    ),
                  ),
                  SizedBox(height: getVerticalSize(16)),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (controller.resendOtpBool.value) {
                          controller.countDown();
                          print("true");
                          // getCtrl.sendOtp(context);
                        } else {
                          print("False");
                        }
                      },
                      child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: MyText(
                                title: "Didn't receive OTP?",
                                customWeight: FontWeight.w300,
                                clr: Colors.black,
                              )),
                          GestureDetector(
                              onTap: () {
                                if(controller.myDuration.value.inSeconds<=0){
                                  controller.resendApi(context).then((value) => {

                                    if(controller.apiCallStatus==ApiCallStatus.success){
                                      print('OTP sent successfull'),
                                      controller.resetTimer(),
                                    }

                                  });
                                }

                              },
                              child: MyText(
                                title: " Resend",
                                customWeight: FontWeight.w500,
                                clr: controller.myDuration.value.inSeconds>0?Colors.white10:Colors.black,
                              )),

                        ],
                      ),)
                    ),
                  ),
                  SizedBox(height: getVerticalSize(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: getPadding(top: 1),
                        child:
                        Obx(
                              () =>
                              Text('Expire in: ${strDigits(controller.myDuration.value.inMinutes)
                              }:${strDigits(controller.myDuration.value.inSeconds.remainder(60))}',
                                //Text('0${controller.min}:${controller.sec.toString().length == 1 ? '0${controller.sec}' : controller.sec}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                // style: AppStyle.txtSourceSansProSemiBold14Gray600.copyWith(height: 1.29)
                              ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getVerticalSize(16),),
                  SizedBox(height: getVerticalSize(16),),
                  MyAnimatedButton(
                    radius: 30.0,
                    height: getVerticalSize(60),
                    width: getHorizontalSize(400),
                    fontSize: 20 ,
                    bgColor: ColorConstant.anbtnBlue,
                    controller: controller.btnController,
                    title: "Verify OTP".tr,
                    onTap: () async {
                      Future.delayed(const Duration(milliseconds: 400), () {
                        controller.verifyOtpApi();
                        //   Get.offAllNamed(AppRoutes.completeYourProfileScreen);
                      });
                      //  Get.toNamed(AppRoutes.homePage);

                    },
                  ),
                  // Text(
                  //   "Expires in: ${controller.expiryTime}",
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  SizedBox(height: 16),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Handle resend OTP action
                  //   },
                  //   child: Text(
                  //     "Didn't get code? Resend",
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.blue,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  /// Section Widget


}
