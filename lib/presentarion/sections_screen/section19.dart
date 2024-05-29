import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';
///also 15 16 27
class Section19 extends StatelessWidget {
  final List<Bed> beds;

  Section19({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            child: Row(
              children: [
                Column(
                  children: [
                    HBedWidget(bed: beds[0]),
                    SizedBox(height: getVerticalSize(100),),
                    HBedWidget(bed: beds[0]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HBedWidget(bed: beds[0]),
                   // SizedBox(width: getHorizontalSize(150),),

                    Column(
                      children: [
                        VBedWidget(bed: beds[1]),
                        SizedBox(height: getVerticalSize(10),),
                        VBedWidget(bed: beds[0]),
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