import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section53 extends StatelessWidget {
  final List<Bed> beds;

  Section53({required this.beds});

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
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[2]),
                    HBedWidget(bed: beds[3]),
                    HBedWidget(bed: beds[4]),
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(10),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      VBedWidget(bed: beds[4]),
                      VBedWidget(bed: beds[5]),
                      VBedWidget(bed: beds[11]),
                      VBedWidget(bed: beds[17]),
                      VBedWidget(bed: beds[23]),

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          VBedWidget(bed: beds[6]),
                          VBedWidget(bed: beds[7]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[12]),
                          VBedWidget(bed: beds[13]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[18]),
                          VBedWidget(bed: beds[19]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[24]),
                          VBedWidget(bed: beds[25]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          VBedWidget(bed: beds[8]),
                          VBedWidget(bed: beds[9]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[14]),
                          VBedWidget(bed: beds[15]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[20]),
                          VBedWidget(bed: beds[21]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[26]),
                          VBedWidget(bed: beds[27]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      VBedWidget(bed: beds[10]),
                      VBedWidget(bed: beds[16]),
                      VBedWidget(bed: beds[22]),
                      VBedWidget(bed: beds[28]),
                     // VBedWidget(bed: beds[30]),

                    ],
                  ),
                ],
              ),
              SizedBox(height: getVerticalSize(10),),
              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[29]),
                    HBedWidget(bed: beds[30]),
                    HBedWidget(bed: beds[31]),
                    HBedWidget(bed: beds[32]),
                  ],
                ),
              ),







            ],
          ),
        ),
        // Left border AC labels

      ],
    );
  }
}