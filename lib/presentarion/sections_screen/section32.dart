import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';

import '../../core/utils/color_constant.dart';
import 'eventselection_screen.dart';
import 'models/sections_model.dart';

class Section32 extends StatelessWidget {
  final List<Bed> beds;

  Section32({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),
            ],
          ),
          SizedBox(
            height: getVerticalSize(10),
          ),

          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  VBedWidget(bed: beds[0]),
                  SizedBox(height: getVerticalSize(5),),
                  VBedWidget(bed: beds[1]),
                  VBedWidget(bed: beds[4]),
                ],
              ),
              Row(
                children: [
                  Column(
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
                      SizedBox(height: getVerticalSize(25),),
                      Row(
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
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),


            ],
          ),
          SizedBox(
            height: getVerticalSize(10),
          ),



          Row(
            children: [
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),
              HBedWidget(bed: beds[0]),
              HBedWidget(bed: beds[1]),
            ],
          ),


        ],
      ),
    );
  }
}