import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section38 extends StatelessWidget {
  final List<Bed> beds;

  Section38({required this.beds});

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
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: getHorizontalSize(150),),

                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[2]),
                  ],
                ),
              ),

              SizedBox(height: getVerticalSize(10),),
    FittedBox(child:
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: getHorizontalSize(180),),

        Column(
          children: [
            HBedWidget(bed: beds[3]),
            HBedWidget(bed: beds[4]),
          ],
        ),
        Column(
          children: [
            HBedWidget(bed: beds[5]),
            HBedWidget(bed: beds[6]),
          ],
        ),
        SizedBox(width: getHorizontalSize(40),),

        // SizedBox(width: getHorizontalSize(80),),
      ],
    ),
    ),

              SizedBox(height: getVerticalSize(10),),
              FittedBox(
                child: Row(
                  children: [
                    VBedWidget(bed: beds[7]),
                    Column(
                      children: [
                        HBedWidget(bed: beds[8]),
                        HBedWidget(bed: beds[12]),
                      ],
                    ),
                    Column(
                      children: [
                        HBedWidget(bed: beds[11]),
                        HBedWidget(bed: beds[13]),
                      ],
                    ),
                    Column(
                      children: [
                        HBedWidget(bed: beds[10]),
                        HBedWidget(bed: beds[14]),
                      ],
                    ),
                    Column(
                      children: [
                        HBedWidget(bed: beds[11]),
                        HBedWidget(bed: beds[15]),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(10),),
              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[16]),
                    HBedWidget(bed: beds[17]),
                    HBedWidget(bed: beds[18]),
                    HBedWidget(bed: beds[19]),
                    HBedWidget(bed: beds[20]),

                  ],
                ),
              )




            ],
          ),
        ),
        // Left border AC labels

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
          top: 60, // Adjust the position as needed
          right: -25, // Adjust the position as needed
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
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

      ],
    );
  }
}