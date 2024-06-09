import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';
///also 15 16 77
class Section29_V1 extends StatelessWidget {
  final List<Bed> beds;

  Section29_V1({required this.beds});

  @override
  Widget build(BuildContext context) {
    print("${beds[0].isReserved}");
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HBedWidget(bed: beds[0]),
              SizedBox(width: getHorizontalSize(11),),
              HBedWidget(bed: beds[1]),
              SizedBox(width: getHorizontalSize(10),),
              HBedWidget(bed: beds[2]),
            ],
          ),
          SizedBox(
            height: getVerticalSize(17),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(

                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  HBedWidget(bed: beds[3]),
                                  HBedWidget(bed: beds[4]),

                                ],
                              ),

                              Row(
                                children: [
                                  HBedWidget(bed: beds[6]),
                                  HBedWidget(bed: beds[7]),
                                ],
                              ),

                            ],
                          )
                        ],
                      ),
                      SizedBox(height: getVerticalSize(15),),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  HBedWidget(bed: beds[8]),
                                  HBedWidget(bed: beds[9]),
                                ],
                              ),
                              Row(
                                children: [
                                  HBedWidget(bed: beds[10]),
                                  HBedWidget(bed: beds[11]),
                                ],
                              ),

                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  VBedWidget(bed: beds[5]),
                  EmptyBedWidget(bed: beds[8]),
                ],
              ),


            ],
          ),
          SizedBox(
            height: getVerticalSize(20),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HBedWidget(bed: beds[12]),
              SizedBox(width: getHorizontalSize(10),),
              HBedWidget(bed: beds[13]),
              SizedBox(width: getHorizontalSize(10),),
              HBedWidget(bed: beds[14]),
            ],
          ),


        ],
      ),
    );
  }
}