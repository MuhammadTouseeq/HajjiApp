import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section52 extends StatelessWidget {
  final List<Bed> beds;

  Section52({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // First row with 4 beds
          FittedBox(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HBedWidget(bed: beds[1]),
                  HBedWidget(bed: beds[1]),
                  HBedWidget(bed: beds[2]),
                  HBedWidget(bed: beds[1]),

                ]),
          ),
          SizedBox(height: 10,),

          FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    VBedWidget(bed: beds[1]),
                    SizedBox(height: getVerticalSize(5),),
                    VBedWidget(bed: beds[0]),

                  ],
                ),
                Column(
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[0]),
                          HBedWidget(bed: beds[1]),

                        ]),

                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HBedWidget(bed: beds[1]),
                          HBedWidget(bed: beds[0]),
                          HBedWidget(bed: beds[1]),
                        ]),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),

          FittedBox(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HBedWidget(bed: beds[1]),
                  HBedWidget(bed: beds[1]),
                  HBedWidget(bed: beds[21]),
                  HBedWidget(bed: beds[22]),
                ]),
          ),

        ],
      ),
    );
  }
}