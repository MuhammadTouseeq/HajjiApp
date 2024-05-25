import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
import 'controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.aappbarColor,
        title: Padding(
          padding: getPadding(left: 50,),
          child: MyText(title: 'Notifications',fontSize: 16,customWeight: FontWeight.bold,),
        ),
       // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorConstant.black900,),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),


      ),
      body: Padding(
        padding: getPadding(all: 10),
        child: Column(
          children: [
            SizedBox(height: getVerticalSize(30),),
            Container(
              padding: getPadding(all: 10),
              color: ColorConstant.whiteA700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonImageView(
                            imagePath: ImageConstant.dotImage,
                          ),
                          SizedBox(width: getHorizontalSize(10),),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                MyText(title: "The bed you reserved in Camp Number 02 has been confirmed."),
                                SizedBox(height: getVerticalSize(10),),
                                MyText(title: "June 23, 2024 at 09:15 am",clr: ColorConstant.appDescriptionTextColor,),
                                SizedBox(height: getVerticalSize(10),),
                                Divider(color: ColorConstant.gray600,)

                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),


                ],
              ),
            )


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
