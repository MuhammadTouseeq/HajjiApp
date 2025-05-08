import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section60 extends StatelessWidget {
  final List<Bed> beds;

  Section60({required this.beds});

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
              FittedBox(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        VBedWidget(bed: beds[0]),
                        SizedBox(height: getVerticalSize(10),),
                        VBedWidget(bed: beds[3]),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HBedWidget(bed: beds[2]),
                        SizedBox(width: getHorizontalSize(150),),

                        Column(
                          children: [
                            HBedWidget(bed: beds[1]),
                            SizedBox(height: getVerticalSize(100),),
                            HBedWidget(bed: beds[4]),
                          ],
                        )
                      ],
                    ),

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
          top: 90,
          // bottom: -10,
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