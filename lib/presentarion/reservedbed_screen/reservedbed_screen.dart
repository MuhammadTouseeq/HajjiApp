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
import 'controller/reservedbed_controller.dart';

class ReservedbedScreen extends StatelessWidget {
  ReservedbedController controller = Get.put(ReservedbedController());

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
            padding: getPadding(left: 50,),
            child: MyText(title: 'Reserved bed',fontSize: 16,customWeight: FontWeight.bold,),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: ColorConstant.black900,),
            onPressed: () {
              // Handle back button press
              Navigator.pop(context);
            },
          ),
          actions: [
            // CommonImageView(
            //   imagePath: ImageConstant.notificationImage,
            //   height: 10,
            // )
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,color: ColorConstant.black900,),
              onPressed: () {
                Get.toNamed(AppRoutes.notificationPage);
              },
            ),
          ],

        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: ColorConstant.pinkcolor,
                    padding: getPadding(all: 10),
                    child: MyText(
                      title: "Booked",
                      clr: ColorConstant.whiteA700,
                      center: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ColorConstant.greencolor,
                    padding: getPadding(all: 10),
                    child: MyText(
                      title: "Available",
                      clr: ColorConstant.whiteA700,
                      center: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ColorConstant.bluecolor,
                    padding: getPadding(all: 10),
                    child: MyText(
                      title: "You Selected",
                      clr: ColorConstant.whiteA700,
                      center: true,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: getPadding(all: 10),
              color: ColorConstant.appBackgroundgrayColor,
              child: MyText(
                center: true,
                title: 'Click on bed to reserve',
              ),
            ),
            SizedBox(height: 20,),
            Obx(() => Container(
              padding: getPadding(left: 10),
             // width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.dropdowncolor,
                border: Border.all(color: Colors.grey), // Add border decoration
                borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
              ),
              child: DropdownButton<String>(
               // isExpanded: true,
                hint: Text(
                  "Select Camp",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ), // Set the hint text
                iconSize: 35,
                iconEnabledColor: ColorConstant.blackColor,
                iconDisabledColor: ColorConstant.appDescriptionTextColor,
                underline: SizedBox(),
                value: controller.selectedValueConditions.value.isNotEmpty ? controller.selectedValueConditions.value : null,
                items: controller.itemsContidions.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: MyText(
                      title: item,
                      clr: ColorConstant.black900,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedValueConditions.value = newValue;
                  }
                },
              ),
            )),
            SizedBox(height: getVerticalSize(10),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(8.0),
                minScale: 0.1,  // minimum zoom scale
                maxScale: 40.0,  // maximum zoom scale set to a high value
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),  // customize the border color and width
                  ),
                  child: CommonImageView(
                    imagePath: ImageConstant.mapImage,
                    height: 300,
                  ),
                ),
              ),
            ),
            SizedBox(height: getVerticalSize(200),),
            Container(
              decoration: BoxDecoration(
                color: ColorConstant.layoutcolor,
                borderRadius: BorderRadius.circular(5.0)
              ),
              padding: getPadding(all: 10),
              child: MyText(
                title: 'View Full Layout',
                clr: ColorConstant.whiteA700,
              ),
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
