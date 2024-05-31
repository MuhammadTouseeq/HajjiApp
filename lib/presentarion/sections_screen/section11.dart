import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section11 extends StatelessWidget {
  final List<Bed> beds;

  Section11({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Specify the color of the border
              width: 2, // Specify the width of the border
            ),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),

                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: getVerticalSize(20),),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(20),),
                            // HBedWidget(bed: beds[1]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[1]),
                            HBedWidget(bed: beds[1]),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(20),),
                            // HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                          ],
                        ),
                        SizedBox(height: getVerticalSize(20),),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(20),),

                            // HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),

                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(20),),
                            // HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[0]),
                          ],
                        ),


                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        VBedWidget(bed: beds[0]),
                        VBedWidget(bed: beds[1]),
                        VBedWidget(bed: beds[0]),
                      ],
                    )
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),

                  ],
                ),
              ),



            ],
          ),
        ),
        // Left border AC labels
        Positioned(
          // top: (MediaQuery.of(context).size.height / 2) - 40, // Adjust the position as needed
          left: -25, // Adjust the position as needed
          top: 90,
          // bottom: -10,
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
        Positioned(
          // top: (MediaQuery.of(context).size.height / 2) - 40, // Adjust the position as needed
          left: -25, // Adjust the position as needed
          top: 210,
          // bottom: -10,
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
        // Right border AC labels
        Positioned(
          top: 230, // Adjust the position as needed
          right: -25, // Adjust the position as needed
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
        Positioned(
          top: 80, // Adjust the position as needed
          right: -25, // Adjust the position as needed
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),

      ],
    );
  }
}