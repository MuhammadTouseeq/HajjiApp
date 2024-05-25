import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
import 'controller/eventselection_controller.dart';

class EventSelectionScreen extends StatelessWidget {
  EventSelectionController controller = Get.put(EventSelectionController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.aappbarColor,
        title: Padding(
          padding: getPadding(left: 0,),
          child: MyText(title: 'Event Selection',fontSize: 18,customWeight: FontWeight.bold,),
        ),
        centerTitle: false,
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
