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
                      HBedWidget(bed: beds[0]),
                      HBedWidget(bed: beds[1]),
                      SizedBox(width: 10,),
                      VBedWidget(bed: beds[1]),
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
                    VBedWidget(bed: beds[0]),
                    SizedBox(height: 20,),
                    VBedWidget(bed: beds[1]),
                    VBedWidget(bed: beds[0]),
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