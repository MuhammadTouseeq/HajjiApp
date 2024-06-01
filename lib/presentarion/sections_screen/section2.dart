import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section3 extends StatelessWidget {
  final List<Bed> beds;

  Section3({required this.beds});

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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[2]),

                  ]),

              FittedBox(
                child: Row(

                  children: [
                    Column(
                      children: [
                        VBedWidget(bed: beds[3]),
                        VBedWidget(bed: beds[8]),
                      ],
                    ),
                    Container(width: getHorizontalSize(100),),
                    Column(
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                  children: [
                                    HBedWidget(bed: beds[4]),
                                    HBedWidget(bed: beds[5]),

                                  ]),

                              Row(
                                  children: [
                                    HBedWidget(bed: beds[6]),
                                    HBedWidget(bed: beds[7]),
                                  ]),

                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [

                              Row(
                                  children: [
                                    HBedWidget(bed: beds[9]),
                                    HBedWidget(bed: beds[10]),

                                  ]),

                              Row(
                                  children: [
                                    HBedWidget(bed: beds[11]),
                                    HBedWidget(bed: beds[12]),
                                  ]),
                            ],
                          ),
                        )

                      ],
                    )
                  ],
                ),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HBedWidget(bed: beds[13]),
                    HBedWidget(bed: beds[14]),
                    HBedWidget(bed: beds[15]),

                  ]),

            ],
          ),
        ),
        // Left border AC labels
        Positioned(
          // top: (MediaQuery.of(context).size.height / 2) - 40, // Adjust the position as needed
          left: -25, // Adjust the position as needed
          top: 170,
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
          top: 250, // Adjust the position as needed
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