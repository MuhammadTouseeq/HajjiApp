import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../core/model_classes/events_details_model.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
import '../../widgets/custom_textfield_new.dart';
import '../manualentry_screen/manualentry_screen.dart';
import '../scancode_screen/scan_code_screen.dart';
import 'controller/hajji_attendance_controller.dart';



class HajjiAttendanceScreen extends StatelessWidget {
  HajjiAttendanceController controller = Get.put(HajjiAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.aappbarColor,
        title: Padding(
          padding: getPadding(left: 50),
          child: MyText(
            title: 'Hajji Attendance',
            fontSize: 16,
            customWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstant.black900,
          ),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: getPadding(all: 10),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                child: TabBar(
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Ageo',
                    fontWeight: FontWeight.w600,
                  ), // For Selected tab
                  unselectedLabelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Ageo',
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: ColorConstant.black900,
                  controller: controller.tabsController,
                  onTap: (int index) {
                    var index = controller.tabsController.index.toString();
                    print(index);
                  },
                  tabs: [
                    Tab(
                      text: "Scan Bar Code".tr,
                    ),
                    Tab(
                      text: "Manual Entry".tr,
                    ),
                  ],
                  labelColor: ColorConstant.black900,
                  unselectedLabelColor: ColorConstant.gray600,
                ),
              ),
              bindDivider(),
              Expanded(
                child: TabBarView(
                  controller: controller.tabsController,
                  children: [
                    scannerScreen(),
                    manualScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget scannerScreen (){
    return SizedBox(
      width: size.width,
      child: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getVerticalSize(10),),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                final eventDetails = controller.eventDetails.value.eventDetails;
                if (eventDetails != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Event ID: ${eventDetails.eventId}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Event Name: ${eventDetails.eventName}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Event Start Date: ${eventDetails.eventStartDate}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Event Start Time: ${eventDetails.eventStartTime}'),
                        SizedBox(height: getVerticalSize(10)),
                        //Text('Event Image: ${eventDetails.eventImage}'),
                        Text('Total Haaji: ${eventDetails.totalHaaji}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Haaji Attendance Marked: ${eventDetails.haajiAttendanceMarked}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Haaji Attendance Remaining: ${eventDetails.haajiAttendanceRemaining}'),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('No Event Details Found'));
                }
              }
            }),
            SizedBox(height: getVerticalSize(10),),
            MyText(title: "Scan QR Code",fontSize: 25,),

            SizedBox(height: getVerticalSize(30),),
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
                String scannedResult = await controller.scanBarcode();
                print(scannedResult);
                if (scannedResult != 'Scan cancelled' && !scannedResult.startsWith('Error:')) {
                  // Set the haaji_id with the scanned code
                  await controller.managerScanAPI(scannedResult);
                }
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


  Widget manualScreen() {
    return SizedBox(
      width: size.width,
      child: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getVerticalSize(10)),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                final eventDetails = controller.eventDetails.value.eventDetails;
                if (eventDetails != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Event ID: ${eventDetails.eventId}',),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Event Name: ${eventDetails.eventName}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Event Start Date: ${eventDetails.eventStartDate}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Event Start Time: ${eventDetails.eventStartTime}'),
                        SizedBox(height: getVerticalSize(10)),
                        //Text('Event Image: ${eventDetails.eventImage}'),
                        Text('Total Haaji: ${eventDetails.totalHaaji}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Haaji Attendance Marked: ${eventDetails.haajiAttendanceMarked}'),
                        SizedBox(height: getVerticalSize(10)),
                        Text('Haaji Attendance Remaining: ${eventDetails.haajiAttendanceRemaining}'),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('No Event Details Found'));
                }
              }
            }),
            SizedBox(height: getVerticalSize(10)),
            MyText(title: "Manual Entry", fontSize: 25),
           // SizedBox(height: getVerticalSize(30)),
            SizedBox(height: getVerticalSize(80)),
            Padding(
              padding: getPadding(left: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      title: "Hajji Id",
                      clr: ColorConstant.black900,
                      fontSize: 16,
                      // customWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getVerticalSize(10)),
                  CustomTextField(
                    hintText: '1234567',
                    controller: controller.hajjiIdController,
                    isFinal: false,
                    keyboardType: TextInputType.emailAddress,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                    onTap: () {
                      // Handle onTap
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: getVerticalSize(40)),
            MyAnimatedButton(
              radius: 25.0,
              height: getVerticalSize(60),
              width: getHorizontalSize(300),
              fontSize: 16,
              bgColor: ColorConstant.aappbarColor,
              controller: controller.btnController,
              title: "Hajji Arrived".tr,
              onTap: () async {
                controller.managermanualAPI();
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