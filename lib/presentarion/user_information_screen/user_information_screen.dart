import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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
import 'controller/user_information_controller.dart';
//check commit
// ignore_for_file: must_be_immutable
class UserInformationScreen extends GetWidget<UserInformationController> {
  final selectedOption = RxBool(false);
  UserInformationScreen({Key? key})
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
                    title: "Begin Your\nJourney ",
                  clr: ColorConstant.black900,
                  fontSize: 35,
                    customWeight: FontWeight.bold,
                ),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(
                    title: "Lorem Ipsum is simply dummy text of the printing and type industry.",
                  clr: ColorConstant.whiteA700,
                  fontSize: 16,
                   customWeight: FontWeight.w400,
                   // customWeight: FontWeight.bold,
                ),
                  SizedBox(height: getVerticalSize(100),),
                  MyText(
                    title: "Phone Number",
                    clr: ColorConstant.black900,
                    fontSize: 19,
                    // customWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getVerticalSize(10),),
                  CustomTextField(
                    hintText: 'Email@domain.com',
                    controller: controller.phoneNumber,
                    isFinal: false,
                    keyboardType: TextInputType.emailAddress,
                   // limit: HelperFunction.EMAIL_VALIDATION,
                    // validator: (value) {
                    //   return HelperFunction.emailValidate(value!);
                    // },
                  ),
                  // InternationalPhoneNumberInput(
                  //   cursorColor: ColorConstant.hintTextColor,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Phone number is required';
                  //     } else if (!controller.isValidate.value) {
                  //       return 'Phone number is invalid';
                  //     }
                  //   },
                  //   countrySelectorScrollControlled: true,
                  //   textFieldController: controller.phoneNumber,
                  //   onInputChanged: (PhoneNumber number) {
                  //     print(number.phoneNumber);  // This will print the full phone number including country code
                  //     controller.phoneNo.value = number.phoneNumber!;
                  //   },
                  //   onInputValidated: (bool value) {
                  //     print(value);
                  //     controller.isValidate.value = value;
                  //   },
                  //   selectorConfig: SelectorConfig(
                  //     leadingPadding: 10.0,
                  //     showFlags: true,
                  //     trailingSpace: false,
                  //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  //     setSelectorButtonAsPrefixIcon: true,
                  //   ),
                  //   autoValidateMode: AutovalidateMode.onUserInteraction,
                  //   initialValue: controller.initialPhone,
                  //   searchBoxDecoration: InputDecoration(
                  //     hintText: "Search",
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       borderSide: BorderSide(color: ColorConstant.gray600, width: 1.0),
                  //     ),
                  //     errorBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       borderSide: BorderSide(color: ColorConstant.hintTextColor, width: 1.0),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       borderSide: BorderSide(color: ColorConstant.hintTextColor, width: 1.0),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       borderSide: BorderSide(color: ColorConstant.hintTextColor, width: 1.0),
                  //     ),
                  //     disabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       borderSide: BorderSide(color: ColorConstant.hintTextColor, width: 1.0),
                  //     ),
                  //   ),
                  //   inputDecoration: InputDecoration(
                  //     fillColor: ColorConstant.whiteA700,
                  //     filled: true,
                  //     contentPadding: EdgeInsets.all(15),
                  //     hintStyle: TextStyle(color: ColorConstant.gray600),
                  //     labelStyle: TextStyle(color: ColorConstant.gray600),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //       borderSide: BorderSide(color: ColorConstant.whiteA700),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //       borderSide: BorderSide(width: 1.0, color: ColorConstant.textfieldborder),
                  //     ),
                  //     errorBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //       borderSide: BorderSide(width: 1.0, color: ColorConstant.textfieldborder),
                  //     ),
                  //     disabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //       borderSide: BorderSide(width: 1.0, color: ColorConstant.textfieldborder),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //       borderSide: BorderSide(width: 1, color: ColorConstant.textfieldborder),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(height: getVerticalSize(20),),
                  MyText(
                    title: "Email Address",
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
                  SizedBox(height: getVerticalSize(16),),


                  SizedBox(height: getVerticalSize(16),),

                  MyAnimatedButton(
                    radius: 25.0,
                    height: getVerticalSize(60),
                    width: getHorizontalSize(400),
                    fontSize: 20 ,
                    bgColor: ColorConstant.anbtnBlue,
                    controller: controller.btnController,
                    title: "Submit".tr,
                    onTap: () async {
                      controller.UserApi(context);
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
