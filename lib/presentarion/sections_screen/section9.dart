import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section9 extends StatelessWidget {
  final List<Bed> beds;

  Section9({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FittedBox(
            child: Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                      HBedWidget(bed: beds[2]),
                      HBedWidget(bed: beds[3]),
                      SizedBox(width: 10,),
                      VBedWidget(bed: beds[4]),
                    ]),
              ],
            ),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [

                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[5]),
                        HBedWidget(bed: beds[6]),
                        HBedWidget(bed: beds[7]),
                        HBedWidget(bed: beds[8]),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[9]),
                        HBedWidget(bed: beds[10]),
                        HBedWidget(bed: beds[11]),
                        HBedWidget(bed: beds[12]),



                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[13]),
                        HBedWidget(bed: beds[14]),
                        HBedWidget(bed: beds[15]),
                        HBedWidget(bed: beds[16]),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: getHorizontalSize(25),),
                        HBedWidget(bed: beds[17]),
                        HBedWidget(bed: beds[18]),
                        HBedWidget(bed: beds[19]),
                        HBedWidget(bed: beds[20]),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    VBedWidget(bed: beds[21]),
                    SizedBox(height: 20,),
                    VBedWidget(bed: beds[22]),
                    VBedWidget(bed: beds[23]),
                  ],
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}