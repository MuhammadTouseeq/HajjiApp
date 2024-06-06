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
import 'controller/signin_controller.dart';
//check commit
// ignore_for_file: must_be_immutable
class SignInScreen extends GetWidget<SignInController> {
  final selectedOption = RxBool(false);
  SignInScreen({Key? key})
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


                  SizedBox(height: getVerticalSize(30),),

                  MyAnimatedButton(
                    radius: 25.0,
                    height: getVerticalSize(60),
                    width: getHorizontalSize(400),
                    fontSize: 20,
                    bgColor: ColorConstant.anbtnBlue,
                    controller: controller.btnController,
                    title: "Sign In".tr,
                      onTap: () async {
                        String email = controller.emailController.text;
                        String password = controller.passController.text;

                        if (email.isEmpty || password.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "Fields can't be empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (controller.formKey.currentState!.validate()) {
                          // Perform your validation logic here
                          if (email == 'test@gmail.com' && password == '123456') {
                            Fluttertoast.showToast(
                              msg: "User details found",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Get.toNamed(AppRoutes.dashboradPage);
                          } else {
                            Fluttertoast.showToast(
                              msg: "Invalid account",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        }
                      }
                  ),
                  SizedBox(height: getVerticalSize(20),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(title: "Don't have an account?"),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.signUpPage);
                        },
                          child: MyText(title: "  Sign up",clr: ColorConstant.whiteA700,customWeight: FontWeight.bold,))
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
