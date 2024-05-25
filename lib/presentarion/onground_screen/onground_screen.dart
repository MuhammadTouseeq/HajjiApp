import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
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
import 'controller/onground_controller.dart';
//check commit
// ignore_for_file: must_be_immutable
class OngroundScreen extends GetWidget<OngroundController> {
  final selectedOption = RxBool(false);
  OngroundScreen({Key? key})
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
                  MyText(
                    title: "Welcome to\nHajji App",
                  clr: ColorConstant.black900,
                  fontSize: 35,
                    customWeight: FontWeight.bold,
                ),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(
                    title: "Lorem Ipsum is simply dummy text of the printing and type industry.",
                  clr: ColorConstant.whiteA700,
                  fontSize: 16,
                   // customWeight: FontWeight.bold,
                ),
                  SizedBox(height: getVerticalSize(100),),
                  MyText(
                    title: "User Name",
                    clr: ColorConstant.black900,
                    fontSize: 19,
                    // customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  CustomTextField(
                    controller: controller.hajjIdController,
                    isFinal: false,
                    keyboardType: TextInputType.emailAddress,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.hajjidValidate(value!);
                    },
                  ),
                  SizedBox(height: getVerticalSize(16),),
                  MyText(
                    title: "Password",
                    clr: ColorConstant.black900,
                    fontSize: 19,
                    // customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getVerticalSize(10),),
                 Obx(() =>  CustomTextField(
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
                   controller: controller.passwordController,
                   isFinal: false,
                   keyboardType: TextInputType.emailAddress,
                   isPassword: controller.isShowPassword.value,
                   limit: HelperFunction.EMAIL_VALIDATION,
                   validator: (value) {
                     return HelperFunction.passwordValidate(value!);
                   },
                 ),),


                  SizedBox(height: getVerticalSize(16),),

                  MyAnimatedButton(
                    radius: 25.0,
                    height: getVerticalSize(60),
                    width: getHorizontalSize(400),
                    fontSize: 20 ,
                    bgColor: ColorConstant.anbtnBlue,
                    controller: controller.btnController,
                    title: "Sign In".tr,
                    onTap: () async {
                      controller.loginAPI(context);
                    //  Get.toNamed(AppRoutes.homePage);

                    },
                  ),
                  SizedBox(height: getVerticalSize(20)),

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
