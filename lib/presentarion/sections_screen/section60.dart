import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section60 extends StatelessWidget {
  final List<Bed> beds;

  Section60({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(
                 children: [
                   VBedWidget(bed: beds[0]),
                   SizedBox(height: getVerticalSize(10),),
                   VBedWidget(bed: beds[0]),

                 ],
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   HBedWidget(bed: beds[1]),
                 SizedBox(width: getHorizontalSize(150),),

                 Column(
                   children: [
                     HBedWidget(bed: beds[1]),
                     SizedBox(height: getVerticalSize(100),),
                     HBedWidget(bed: beds[1]),
                   ],
                 )
                 ],
               ),

              ],
            ),
          )






        ],
      ),
    );
  }
}