import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section53 extends StatelessWidget {
  final List<Bed> beds;

  Section53({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}