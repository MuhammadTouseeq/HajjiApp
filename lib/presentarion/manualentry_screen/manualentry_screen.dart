import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/manualentry_controller.dart';

class ManualEntryScreen extends StatelessWidget {
  ManualEntryController controller = Get.put(ManualEntryController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getVerticalSize(100),),
            MyText(title: "Manual Entry",fontSize: 25,),
            SizedBox(height: getVerticalSize(30),),
            MyText(
                center: true,
                title: "Lorem Ipsum   is simply dummy text of the printing and type setting industry"),
            SizedBox(height: getVerticalSize(80),),
            Align(
              alignment: Alignment.topLeft,
              child: MyText(
                title: "Hajji Id",
                clr: ColorConstant.black900,
                fontSize: 16,
                // customWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: getVerticalSize(10),),
            CustomTextField(
              hintText: '1234567',
              controller: controller.hajjiIdController,
              isFinal: false,
              keyboardType: TextInputType.emailAddress,
              limit: HelperFunction.EMAIL_VALIDATION,
              validator: (value) {
                return HelperFunction.stringValidate(value!);
              },
            ),

            SizedBox(height: getVerticalSize(40),),
            MyAnimatedButton(
              radius: 25.0,
              height: getVerticalSize(60),
              width: getHorizontalSize(300),
              fontSize: 16,
              bgColor: ColorConstant.aappbarColor,
              controller: controller.btnController,
              title: "Hajji Arrived".tr,
              onTap: () async {

              },
            ),


          ],
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
