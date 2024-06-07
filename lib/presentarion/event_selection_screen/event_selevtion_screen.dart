import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animated_custom_button.dart';
import 'controller/event_selection_controller.dart';

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
          padding: getPadding(left: 50,),
          child: MyText(title: 'Event Selection',fontSize: 16,customWeight: FontWeight.bold,),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getVerticalSize(30),),
              Container(
                padding: getPadding(all: 10),
                color: ColorConstant.whiteA700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 230,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap:() {
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.textfieldborder,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                CommonImageView(
                                  imagePath: ImageConstant.minahImage,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: double.infinity,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: getPadding(left: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: getVerticalSize(5),),
                                        MyText(title: "Minah"),
                                        SizedBox(height: getVerticalSize(5),),
                                        Row(
                                          children: [
                                            MyText(title: "."),
                                            MyText(title: "22 june 2024",fontSize: 14,),
                                          ],
                                        ),
                                        SizedBox(height: getVerticalSize(5),),
                                        Row(
                                          children: [
                                            MyText(title: "."),
                                            MyText(title: "10:30 am",fontSize: 14,),
                                          ],
                                        ),
                                        SizedBox(height: getVerticalSize(5),),
                                        Row(
                                          children: [
                                            MyText(title: "."),
                                            MyText(title: "Total Regestered 250",fontSize: 14,),
                                          ],
                                        ),
                                        SizedBox(height: getVerticalSize(5),),
                                        Row(
                                          children: [
                                            MyText(title: "."),
                                            MyText(title: "Remaning 150",fontSize: 14,),
                                          ],
                                        ),
                                        SizedBox(height: getVerticalSize(5),),

                                      ],
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        );
                      },
                    ),


                  ],
                ),
              )


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

