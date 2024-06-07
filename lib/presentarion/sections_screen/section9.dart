import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';
import 'custom_ac.dart';


class Section9 extends StatelessWidget {
  final List<Bed> beds;

  Section9({required this.beds});

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
              FittedBox(
                child: Row(
                  children: [
                    FittedBox(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[1]),
                            HBedWidget(bed: beds[2]),
                            HBedWidget(bed: beds[3]),
                            SizedBox(width: 10,),
                            VBedWidget(bed: beds[4]),
                          ]),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          children: [
                            VBedWidget(bed: beds[5]),
                            VBedWidget(bed: beds[13]),
                          ],
                        ),
                        Column(
                          children: [

                            Row(
                              children: [
                                HBedWidget(bed: beds[6]),
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[8]),
                              ],
                            ),
                            Row(
                              children: [
                                HBedWidget(bed: beds[9]),
                                HBedWidget(bed: beds[10]),
                                HBedWidget(bed: beds[11]),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                HBedWidget(bed: beds[14]),
                                HBedWidget(bed: beds[15]),
                                HBedWidget(bed: beds[16]),
                              ],
                            ),
                            Row(
                              children: [
                                HBedWidget(bed: beds[18]),
                                HBedWidget(bed: beds[19]),
                                HBedWidget(bed: beds[20]),


                              ],
                            ),


                            SizedBox(height: getVerticalSize(30),),
                            Container(
                              padding: getPadding(right: 10),
                              child: Row(
                                  children: [
                                    HBedWidget(bed: beds[21]),
                                    HBedWidget(bed: beds[22]),
                                    HBedWidget(bed: beds[23]),
                                    HBedWidget(bed: beds[24]),
                                  ]),
                            ),

                          ],
                        ),


                      ],
                    ),
                    Column(
                      children: [
                        VBedWidget(bed: beds[12]),
                        VBedWidget(bed: beds[17]),
                        VBedWidget(bed: beds[25]),
                        // VBedWidget(bed: beds[0]),
                      ],
                    ),

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