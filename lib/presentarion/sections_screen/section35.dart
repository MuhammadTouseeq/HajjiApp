import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';
import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section35 extends StatelessWidget {
  final List<Bed> beds;

  Section35({required this.beds});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        VBedWidget(bed: beds[1]),
                        VBedWidget(bed: beds[4]),
                        VBedWidget(bed: beds[1]),
                        VBedWidget(bed: beds[4]),
                      ],
                    ),
                    // SizedBox(width: getVerticalSize(10),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[1]),
                            HBedWidget(bed: beds[7]),
                            HBedWidget(bed: beds[1]),
                          ],
                        ),
                        SizedBox(height: getVerticalSize(20),),
                        Row(
                          children: [
                            Column(
                              children: [
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[7]),
                              ],
                            ),
                            Column(
                              children: [
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[7]),
                              ],
                            ),
                            Column(
                              children: [
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[7]),
                              ],
                            ),
                            SizedBox(width: getHorizontalSize(50),),
                            Column(
                              children: [
                                VBedWidget(bed: beds[1]),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: getVerticalSize(10),),
                        Row(
                          children: [
                            Column(
                              children: [
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[7]),
                              ],
                            ),
                            Column(
                              children: [
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[7]),
                              ],
                            ),
                            Column(
                              children: [
                                HBedWidget(bed: beds[7]),
                                HBedWidget(bed: beds[7]),
                              ],
                            ),
                            SizedBox(width: getHorizontalSize(50),),
                            Column(
                              children: [
                                VBedWidget(bed: beds[4]),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: getVerticalSize(50),),
                        Row(
                          children: [
                            HBedWidget(bed: beds[7]),
                            HBedWidget(bed: beds[1]),
                            HBedWidget(bed: beds[7]),
                            HBedWidget(bed: beds[1]),
                          ],
                        ),
                      ],
                    )



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
          top: 160,
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
          top: 220, // Adjust the position as needed
          right: -25, // Adjust the position as needed
          child: ACLabel(
            title: "AC",
            backgroundColor: ColorConstant.blackColor,
            textColor: ColorConstant.whiteA700,
            isVertical: true,
          ),
        ),
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
      ],
    );
  }
}