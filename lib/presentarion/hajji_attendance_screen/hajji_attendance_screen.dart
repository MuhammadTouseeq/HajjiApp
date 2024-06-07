import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
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
                    ScanCodeScreen(),
                    ManualEntryScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}