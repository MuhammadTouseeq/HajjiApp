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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Specify the color of the border
              width: 2, // Specify the width of the border
            ),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Column(
            children: [
              FittedBox(
                child: Row(
                  children: [
                    FittedBox(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[1]),
                            HBedWidget(bed: beds[0]),
                            HBedWidget(bed: beds[1]),
                            SizedBox(width: 10,),
                            VBedWidget(bed: beds[1]),
                          ]),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            VBedWidget(bed: beds[0]),
                            SizedBox(height: getVerticalSize(30),),
                            VBedWidget(bed: beds[0]),
                          ],
                        ),
                        Column(
                          children: [

                            Row(
                              children: [
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                              ],
                            ),
                            Row(
                              children: [
                                //  SizedBox(width: getHorizontalSize(25),),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                // SizedBox(width: getHorizontalSize(30),),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                              ],
                            ),
                            Row(
                              children: [

                                // SizedBox(width: getHorizontalSize(25),),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),
                                HBedWidget(bed: beds[0]),
                                HBedWidget(bed: beds[1]),


                              ],
                            ),


                            SizedBox(height: getVerticalSize(30),),
                            Container(
                              // color: ColorConstant.blackColor,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    HBedWidget(bed: beds[0]),
                                    HBedWidget(bed: beds[1]),
                                    HBedWidget(bed: beds[0]),
                                    HBedWidget(bed: beds[1]),
                                    SizedBox(width: 10,),
                                    VBedWidget(bed: beds[0]),
                                  ]),
                            ),

                          ],
                        ),


                      ],
                    ),
                    Column(
                      children: [
                        VBedWidget(bed: beds[0]),
                        SizedBox(height: 20,),
                        VBedWidget(bed: beds[1]),
                        // VBedWidget(bed: beds[0]),
                      ],
                    ),

                  ],
                ),
              ),



            ],
          ),
        ),
      ],
    );
  }
}