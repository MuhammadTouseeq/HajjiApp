import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section19 extends StatelessWidget {
  final List<Bed> beds;

  Section19({required this.beds});

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
                  children: [
                    Column(
                      children: [
                        HBedWidget(bed: beds[0]),
                        SizedBox(height: getVerticalSize(100),),
                        HBedWidget(bed: beds[1]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HBedWidget(bed: beds[2]),
                        // SizedBox(width: getHorizontalSize(150),),

                        Column(
                          children: [
                            VBedWidget(bed: beds[3]),
                            SizedBox(height: getVerticalSize(10),),
                            VBedWidget(bed: beds[4]),
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
        // Right border AC labels

        Positioned(
          top: 90, // Adjust the position as needed
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