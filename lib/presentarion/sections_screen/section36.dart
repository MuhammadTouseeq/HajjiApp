import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';
import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section36 extends StatelessWidget {
  final List<Bed> beds;

  Section36({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // First row with 4 beds
          FittedBox(
            child: Row(
                children: [
                  HBedWidget(bed: beds[0]),
                  HBedWidget(bed: beds[1]),
                  HBedWidget(bed: beds[2]),
                  HBedWidget(bed: beds[1]),
                  HBedWidget(bed: beds[1]),
                ]),
          ),

          FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    VBedWidget(bed: beds[4]),
                    SizedBox(height: getVerticalSize(10),),
                    VBedWidget(bed: beds[5]),
                    VBedWidget(bed: beds[6]),
                  ],
                ),
                Column(
                  children: [
                    Row(
                        children: [
                          HBedWidget(bed: beds[7]),
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[9]),
                          HBedWidget(bed: beds[1]),
                          SizedBox(width: getHorizontalSize(30),)
                        ]),

                    Row(
                        children: [
                          HBedWidget(bed: beds[10]),
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[0]),
                          HBedWidget(bed: beds[1]),
                          SizedBox(width: getHorizontalSize(30),)
                        ]),

                    Container(height: 30,),
                    Row(
                        children: [
                          HBedWidget(bed: beds[13]),
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[15]),
                          HBedWidget(bed: beds[1]),
                          SizedBox(width: getHorizontalSize(30),)
                        ]),

                    Row(
                        children: [
                          HBedWidget(bed: beds[16]),
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[18]),
                          HBedWidget(bed: beds[1]),
                          SizedBox(width: getHorizontalSize(30),)
                        ]),
                  ],
                )
              ],
            ),
          ),

          FittedBox(
            child: Row(
                children: [
                  HBedWidget(bed: beds[19]),
                  HBedWidget(bed: beds[20]),
                  HBedWidget(bed: beds[21]),
                  HBedWidget(bed: beds[22]),
                  HBedWidget(bed: beds[22]),
                ]),
          ),

        ],
      ),
    );
  }
}