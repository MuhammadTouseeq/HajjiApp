import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';
///also 15 16 77
class Section13 extends StatelessWidget {
  final List<Bed> beds;

  Section13({required this.beds});

  @override
  Widget build(BuildContext context) {
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
            height: getVerticalSize(10),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  VBedWidget(bed: beds[5]),
                  VBedWidget(bed: beds[8]),
                ],
              ),
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
                     SizedBox(height: getVerticalSize(9),),
                     Row(
                       children: [
                         Column(
                           children: [
                             Row(
                               children: [
                                 HBedWidget(bed: beds[9]),
                                 HBedWidget(bed: beds[10]),
                               ],
                             ),
                             Row(
                               children: [
                                 HBedWidget(bed: beds[11]),
                                 HBedWidget(bed: beds[12]),
                               ],
                             ),

                           ],
                         )
                       ],
                     ),
                   ],
                  )
                ],
              )

            ],
          ),
          SizedBox(
            height: getVerticalSize(10),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HBedWidget(bed: beds[13]),
              SizedBox(width: getHorizontalSize(10),),
              HBedWidget(bed: beds[14]),
              SizedBox(width: getHorizontalSize(10),),
              HBedWidget(bed: beds[15]),
            ],
          ),


        ],
      ),
    );
  }
}