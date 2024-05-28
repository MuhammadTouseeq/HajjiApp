import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section5 extends StatelessWidget {
  final List<Bed> beds;

  Section5({required this.beds});

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
                     SizedBox(width: 5,),
                     HBedWidget(bed: beds[1]),
                     SizedBox(width: 5,),
                     HBedWidget(bed: beds[2]),
                     SizedBox(width: 5,),
                     HBedWidget(bed: beds[3]),
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
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                        HBedWidget(bed: beds[0]),
                      ],
                    ),
                    Row(
                      children: [
                        HBedWidget(bed: beds[0]),
                        HBedWidget(bed: beds[1]),
                        HBedWidget(bed: beds[0]),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    VBedWidget(bed: beds[1]),
                    VBedWidget(bed: beds[5]),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(height: getVerticalSize(20),),
          FittedBox(
            child: Row(

              children: [
                Row(

                    children: [
                      HBedWidget(bed: beds[0]),
                      SizedBox(width: 5,),
                      HBedWidget(bed: beds[1]),
                      SizedBox(width: 5,),
                      HBedWidget(bed: beds[2]),
                      SizedBox(width: 5,),
                      HBedWidget(bed: beds[3]),
                    ]),
              ],
            ),
          ),






        ],
      ),
    );
  }
}