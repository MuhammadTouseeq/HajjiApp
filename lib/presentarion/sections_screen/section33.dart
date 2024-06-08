import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section33 extends StatelessWidget {
  final List<Bed> beds;

  Section33({required this.beds});

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[2]),
                    HBedWidget(bed: beds[3]),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(10),
              ),

              FittedBox(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(width: getHorizontalSize(50),),
                    // Column(
                    //   children: [
                    //     VBedWidget(bed: beds[4]),
                    //     SizedBox(height: getVerticalSize(5),),
                    //     VBedWidget(bed: beds[5]),
                    //     VBedWidget(bed: beds[6]),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    HBedWidget(bed: beds[4]),
                                    HBedWidget(bed: beds[5]),
                                    HBedWidget(bed: beds[6]),

                                  ],
                                ),
                                Row(
                                  children: [
                                    HBedWidget(bed: beds[7]),
                                    HBedWidget(bed: beds[8]),
                                    HBedWidget(bed: beds[9]),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: getVerticalSize(13),),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        HBedWidget(bed: beds[10]),
                                        HBedWidget(bed: beds[11]),
                                        HBedWidget(bed: beds[12]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        HBedWidget(bed: beds[13]),
                                        HBedWidget(bed: beds[14]),
                                        HBedWidget(bed: beds[15]),
                                      ],
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(10),
              ),



              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[16]),
                    HBedWidget(bed: beds[17]),
                    HBedWidget(bed: beds[18]),
                    HBedWidget(bed: beds[19]),
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
          top: 100,
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
          top: 320, // Adjust the position as needed
          right: -25, // Adjust the position as needed
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
        Positioned(
          top: 110, // Adjust the position as needed
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