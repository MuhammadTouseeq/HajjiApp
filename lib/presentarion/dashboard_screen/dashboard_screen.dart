import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/animated_custom_button.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Vector.png'), // Replace 'assets/background_image.jpg' with your image path
          fit: BoxFit.cover, // Adjust as needed
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorConstant.aappbarColor,
          title: Padding(
            padding: getPadding(left: 20,),
            child: MyText(title: 'Home',fontSize: 16,customWeight: FontWeight.bold,),
          ),
         // centerTitle: true,

          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: ColorConstant.black900,),
            onPressed: () {
              // Handle back button press
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,color: ColorConstant.black900,),
              onPressed: () {
                Get.toNamed(AppRoutes.notificationPage);
                // Handle notification icon press here
              },
            ),
          ],

        ),
        body:Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: getPadding(all: 10),
              child: Column(
                children: [
                  SizedBox(height: getVerticalSize(30),),
                  CommonImageView(
                    imagePath: ImageConstant.logoImage,
                    height: 100,
                  ),
                  SizedBox(height: getVerticalSize(30),),
                  MyText(title: "Your Name:",clr: ColorConstant.black900,customWeight: FontWeight.w500,fontSize: 18,),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(title: controller.userDetails!.haajiId ?? "N/A",clr: ColorConstant.whiteA700,customWeight: FontWeight.w500,fontSize: 25,),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(title: "Your Hajji ID:",clr: ColorConstant.black900,customWeight: FontWeight.w500),
                  SizedBox(height: getVerticalSize(10),),
                  MyText(title: controller.userDetails!.haajiId ?? "N/A",clr: ColorConstant.whiteA700,customWeight: FontWeight.w500,fontSize: 25,),
                  SizedBox(height: getVerticalSize(50),),
                  MyAnimatedButton(
                    radius: 25.0,
                    height: getVerticalSize(60),
                    width: getHorizontalSize(400),
                    fontSize: 18,
                    bgColor: ColorConstant.anbtnBlue,
                    controller: controller.btnController,
                    title: "Reserved Bed".tr,
                    onTap: () async {
                      Get.toNamed(AppRoutes.sectionsPage);
                    },
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
