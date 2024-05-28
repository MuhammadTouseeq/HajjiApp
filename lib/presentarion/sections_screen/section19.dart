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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VBedWidget(bed: beds[1]),
              VBedWidget(bed: beds[0]),
            ],
          ),



        ],
      ),
    );
  }
}