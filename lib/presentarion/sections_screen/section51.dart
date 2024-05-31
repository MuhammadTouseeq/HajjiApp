import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section51 extends StatelessWidget {
  final List<Bed> beds;

  Section51({required this.beds});

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
            children: [
              // First row with 4 beds
              FittedBox(
                child: Row(
                    children: [
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[2]),
                      HBedWidget(bed: beds[1]),

                    ]),
              ),
              SizedBox(height: 10,),

              FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        VBedWidget(bed: beds[1]),
                        SizedBox(height: getVerticalSize(10),),
                        VBedWidget(bed: beds[0]),
                        SizedBox(height: getVerticalSize(10),),
                        VBedWidget(bed: beds[0]),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                            children: [
                              HBedWidget(bed: beds[0]),
                              HBedWidget(bed: beds[1]),
                              HBedWidget(bed: beds[0]),

                            ]),

                        Row(
                            children: [
                              HBedWidget(bed: beds[10]),
                              HBedWidget(bed: beds[1]),
                              HBedWidget(bed: beds[0]),
                            ]),

                        Container(height: 30,),
                        Row(
                            children: [
                              HBedWidget(bed: beds[13]),
                              HBedWidget(bed: beds[1]),
                              HBedWidget(bed: beds[15]),
                            ]),

                        Row(
                            children: [
                              HBedWidget(bed: beds[16]),
                              HBedWidget(bed: beds[1]),
                              HBedWidget(bed: beds[0]),

                            ]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),

              FittedBox(
                child: Row(
                    children: [
                      HBedWidget(bed: beds[19]),
                      HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[21]),
                      HBedWidget(bed: beds[22]),
                    ]),
              ),

            ],
          ),
        ),
        // Left border AC labels
        Positioned(
          // top: (MediaQuery.of(context).size.height / 2) - 40, // Adjust the position as needed
          left: -25, // Adjust the position as needed
          top: 110,
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
          top: 300,
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
          top: 270, // Adjust the position as needed
          right: -25, // Adjust the position as needed
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
        Positioned(
          top: 120, // Adjust the position as needed
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