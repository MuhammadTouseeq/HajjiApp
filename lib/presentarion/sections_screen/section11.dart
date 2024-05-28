import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section11 extends StatelessWidget {
  final List<Bed> beds;

  Section11({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),

            ],
          ),
          FittedBox(
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.start,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: getVerticalSize(20),),
                  Row(
                    children: [
                      SizedBox(width: getHorizontalSize(20),),
                     // HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[1]),
                    ],
                  ),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(20),),
                       // HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                      ],
                    ),
                    SizedBox(height: getVerticalSize(20),),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(20),),

                       // HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),

                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(20),),
                       // HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[0]),
                      ],
                    ),


                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    VBedWidget(bed: beds[0]),
                    VBedWidget(bed: beds[1]),
                    VBedWidget(bed: beds[0]),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),

            ],
          ),



        ],
      ),
    );
  }
}