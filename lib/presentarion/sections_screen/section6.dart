import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section6 extends StatelessWidget {
  final List<Bed> beds;

  Section6({required this.beds});

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
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // First row with 4 beds
              FittedBox(
                child: Row(
                  children: [
                    Row(
                        children: [
                          HBedWidget(bed: beds[0]),
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[2]),
                          HBedWidget(bed: beds[3]),
                          HBedWidget(bed: beds[4]),
                        ]),
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(20),),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [

                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(25),),
                            HBedWidget(bed: beds[5]),
                            HBedWidget(bed: beds[6]),
                            HBedWidget(bed: beds[7]),
                            HBedWidget(bed: beds[8]),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(25),),
                            HBedWidget(bed: beds[9]),
                            HBedWidget(bed: beds[10]),
                            HBedWidget(bed: beds[11]),
                            HBedWidget(bed: beds[12]),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(25),),
                            HBedWidget(bed: beds[13]),
                            HBedWidget(bed: beds[14]),
                            HBedWidget(bed: beds[15]),
                            HBedWidget(bed: beds[16]),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: getHorizontalSize(25),),
                            HBedWidget(bed: beds[17]),
                            HBedWidget(bed: beds[18]),
                            HBedWidget(bed: beds[19]),
                            HBedWidget(bed: beds[20]),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        VBedWidget(bed: beds[21]),
                        VBedWidget(bed: beds[22]),
                        VBedWidget(bed: beds[23]),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(20),),
              SizedBox(height: getVerticalSize(20),),
              FittedBox(
                child: Row(
                  children: [
                    Row(
                        children: [
                          HBedWidget(bed: beds[24]),
                          HBedWidget(bed: beds[25]),
                          HBedWidget(bed: beds[26]),
                          HBedWidget(bed: beds[27]),
                          HBedWidget(bed: beds[28]),
                        ]),
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
          top: 80,
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
          top: 200,
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
          top: 200, // Adjust the position as needed
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