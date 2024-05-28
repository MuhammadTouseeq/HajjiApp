import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section3 extends StatelessWidget {
  final List<Bed> beds;

  Section3({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // First row with 4 beds
          Row(
              children: [
                HBedWidget(bed: beds[1]),
                HBedWidget(bed: beds[0]),
                HBedWidget(bed: beds[1]),

              ]),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  VBedWidget(bed: beds[1]),
                  VBedWidget(bed: beds[5]),
                ],
              ),
              Container(width: 30,),
              Column(
                children: [

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                            children: [
                              HBedWidget(bed: beds[0]),
                              HBedWidget(bed: beds[1]),

                            ]),

                        Row(
                            children: [
                              HBedWidget(bed: beds[0]),
                              HBedWidget(bed: beds[1]),
                            ]),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [

                        Row(
                            children: [
                              HBedWidget(bed: beds[0]),
                              HBedWidget(bed: beds[1]),

                            ]),

                        Row(
                            children: [
                              HBedWidget(bed: beds[0]),
                              HBedWidget(bed: beds[1]),
                            ]),
                      ],
                    ),
                  )

                ],
              )
            ],
          ),

          Row(
              children: [
                HBedWidget(bed: beds[1]),
                HBedWidget(bed: beds[20]),
                HBedWidget(bed: beds[1]),

              ]),

        ],
      ),
    );
  }
}