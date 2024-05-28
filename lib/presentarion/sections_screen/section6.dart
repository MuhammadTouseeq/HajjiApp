import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section6 extends StatelessWidget {
  final List<Bed> beds;

  Section6({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // First row with 4 beds
          FittedBox(
            child: Row(
              children: [
                Row(
                    children: [
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                    ]),
              ],
            ),
          ),
          SizedBox(height: getVerticalSize(20),),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [

                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    VBedWidget(bed: beds[1]),
                    VBedWidget(bed: beds[5]),
                    VBedWidget(bed: beds[5]),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(height: getVerticalSize(20),),
          SizedBox(height: getVerticalSize(20),),
          FittedBox(
            child: Row(
              children: [
                Row(
                    children: [
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}