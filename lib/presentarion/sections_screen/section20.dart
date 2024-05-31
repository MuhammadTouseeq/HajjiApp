import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section26 extends StatelessWidget {
  final List<Bed> beds;

  Section26({required this.beds});

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
              Row(
                children: [
                  HBedWidget(bed: beds[0]),
                  SizedBox(width: getHorizontalSize(10),),
                  HBedWidget(bed: beds[1]),
                  SizedBox(width: getHorizontalSize(10),),
                  HBedWidget(bed: beds[0]),
                ],
              ),
              SizedBox(
                height: getVerticalSize(10),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(

                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      HBedWidget(bed: beds[0]),
                                      HBedWidget(bed: beds[1]),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HBedWidget(bed: beds[0]),
                                      HBedWidget(bed: beds[1]),
                                    ],
                                  ),

                                ],
                              )
                            ],
                          ),
                          SizedBox(height: getVerticalSize(10),),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      HBedWidget(bed: beds[0]),
                                      HBedWidget(bed: beds[1]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HBedWidget(bed: beds[0]),
                                      HBedWidget(bed: beds[1]),
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
                  Column(
                    children: [
                      VBedWidget(bed: beds[1]),
                      VBedWidget(bed: beds[4]),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: getVerticalSize(10),
              ),



              Row(
                children: [
                  HBedWidget(bed: beds[0]),
                  SizedBox(width: getHorizontalSize(10),),
                  HBedWidget(bed: beds[1]),
                  SizedBox(width: getHorizontalSize(10),),
                  HBedWidget(bed: beds[0]),
                ],
              ),


            ],
          ),
        ),
        // Left border AC labels
        Positioned(
          // top: (MediaQuery.of(context).size.height / 2) - 40, // Adjust the position as needed
          left: -25, // Adjust the position as needed
          top: 70,
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
          top: 230,
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
          top: 150, // Adjust the position as needed
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