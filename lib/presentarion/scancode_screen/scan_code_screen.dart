import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
import 'controller/scan_code_controller.dart';

class ScanCodeScreen extends StatelessWidget {
  ScanCodeController controller = Get.put(ScanCodeController());

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
            MyText(title: "Scan QR Code",fontSize: 25,),
            SizedBox(height: getVerticalSize(30),),
            MyText(
              center: true,
                title: "Lorem Ipsum is simply dummy text of the printing and type setting industry"),
            SizedBox(height: getVerticalSize(40),),
            CommonImageView(
              imagePath: ImageConstant.qrCodeImage,
            ),
            SizedBox(height: getVerticalSize(40),),
            MyAnimatedButton(
              radius: 25.0,
              height: getVerticalSize(60),
              width: getHorizontalSize(300),
              fontSize: 20,
              bgColor: ColorConstant.aappbarColor,
              controller: controller.btnController,
              title: "Scan".tr,
              onTap: () async {
                controller.scanBarcode();
                print( controller.scannedCode.value,);
              },
            ),
            SizedBox(height: 10,),
            Obx(() => Text(
              controller.scannedCode.value,
              style: TextStyle(fontSize: 16),
            )),
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
