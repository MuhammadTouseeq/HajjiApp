import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../baseviews/baseview_auth_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/animated_custom_button.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_radio_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/signup_controller.dart';
//check commit
// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  final selectedOption = RxBool(false);
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return BaseviewAuthScreen(
      image: true,
      imageShown: ImageConstant.backgroundImage,
      child: Form(
        key: controller.formKey,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(top: 100,left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CommonImageView(
                      imagePath: ImageConstant.logoImage,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: getVerticalSize(50),),
                  MyText(
                    title: "Full Name",
                    clr: ColorConstant.black900,
                    fontSize: 19,
                    // customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  CustomTextField(
                    hintText: 'Enter your name',
                    controller: controller.fullnameController,
                    isFinal: false,
                    keyboardType: TextInputType.emailAddress,
                   // limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(
                    title: "Email",
                    clr: ColorConstant.black900,
                    fontSize: 19,
                    // customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  CustomTextField(
                    hintText: 'Email@domain.com',
                    controller: controller.emailController,
                    isFinal: false,
                    keyboardType: TextInputType.emailAddress,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.emailValidate(value!);
                    },
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(
                    title: "Password",
                    clr: ColorConstant.black900,
                    fontSize: 19,
                    // customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  Obx(() => CustomTextField(
                    postPixText: SvgPicture.asset(
                      controller.isShowPassword.value == true
                          ? ImageConstant.showPass
                          : ImageConstant.imgCheckmark1,
                      color: ColorConstant.appDescriptionTextColor,
                    ),
                    sufixIconOnTap: () {
                      controller.isShowPassword.value =
                          HelperFunction.showPassword(
                              controller.isShowPassword.value);
                    },
                    hintText: '********',
                    controller: controller.passController,
                    isFinal: false,
                    keyboardType: TextInputType.emailAddress,
                    isPassword: controller.isShowPassword.value,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                  ),),
                  SizedBox(height: getVerticalSize(10),),
                  // MyText(
                  //   title: "Confirm Password",
                  //   clr: ColorConstant.black900,
                  //   fontSize: 19,
                  // ),

                  SizedBox(height: getVerticalSize(30),),

                  MyAnimatedButton(
                    radius: 25.0,
                    height: getVerticalSize(60),
                    width: getHorizontalSize(400),
                    fontSize: 20 ,
                    bgColor: ColorConstant.anbtnBlue,
                    controller: controller.btnController,
                    title: "Sign Up".tr,
                      onTap: () async {
                        if (controller.formKey.currentState!.validate()) {
                          Fluttertoast.showToast(
                            msg: "Registered successfully, will be updated in 24 hours.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );

                          // Navigate to the sign-in page after showing success message
                          Get.offAllNamed(AppRoutes.signInPage);
                        } else {
                          Fluttertoast.showToast(
                            msg: "Can't be empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );

                          // Optionally, you can navigate to the sign-in page or stay on the current page
                          // Get.offAllNamed(AppRoutes.signInPage); // Uncomment this line if you want to navigate to sign-in page
                        }
                      }
                  ),
                  SizedBox(height: getVerticalSize(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(title: "Already have an account?"),
                      GestureDetector(
                          onTap: (){
                           Get.back();
                          },
                          child: MyText(title: "  Sign in",clr: ColorConstant.whiteA700,customWeight: FontWeight.bold,))
                    ],
                  ),
                  SizedBox(height: getVerticalSize(20),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget


}
