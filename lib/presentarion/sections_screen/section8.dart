import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'custom_ac.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section8 extends StatelessWidget {
  final List<Bed> beds;

  Section8({required this.beds});

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
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(10),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      VBedWidget(bed: beds[0]),
                      VBedWidget(bed: beds[1]),
                      VBedWidget(bed: beds[0]),
                      VBedWidget(bed: beds[1]),
                      VBedWidget(bed: beds[0]),

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          VBedWidget(bed: beds[1]),
                          VBedWidget(bed: beds[1]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[0]),
                          VBedWidget(bed: beds[0]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[1]),
                          VBedWidget(bed: beds[1]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[1]),
                          VBedWidget(bed: beds[1]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          VBedWidget(bed: beds[1]),
                          VBedWidget(bed: beds[1]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[0]),
                          VBedWidget(bed: beds[0]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[1]),
                          VBedWidget(bed: beds[1]),
                        ],
                      ),
                      Row(
                        children: [
                          VBedWidget(bed: beds[1]),
                          VBedWidget(bed: beds[1]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      VBedWidget(bed: beds[0]),
                      VBedWidget(bed: beds[1]),
                      VBedWidget(bed: beds[0]),
                      VBedWidget(bed: beds[1]),
                      VBedWidget(bed: beds[0]),

                    ],
                  ),
                ],
              ),
              SizedBox(height: getVerticalSize(10),),
              FittedBox(
                child: Row(
                  children: [
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
                    HBedWidget(bed: beds[0]),
                    HBedWidget(bed: beds[1]),
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