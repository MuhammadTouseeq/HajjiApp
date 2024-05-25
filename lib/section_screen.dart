import 'package:flutter/material.dart';

class Bed {
  final String id;
  final String name;
   bool? isReserved=false;
  final bool? hasAC;

  Bed({
    required this.id,
    required this.name,
    this.isReserved,
    this.hasAC,
  });
}

class HBedWidget extends StatelessWidget {
  final Bed bed;

  HBedWidget({required this.bed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
padding: EdgeInsets.symmetric(horizontal: 3),
      child:
     bed.isReserved==true? Image.asset(
        "assets/images/h_bed_red.png",
        width: 90,
        height: 90,
      ): Image.asset(
       "assets/images/h_bed_green.png",
       width: 90,
       height: 90,
     ),
    );
  }
}
class VBedWidget extends StatelessWidget {
  final Bed bed;

  VBedWidget({required this.bed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: EdgeInsets.symmetric(vertical: 3),

      child:  bed.isReserved==true? Image.asset(
        "assets/images/v_bed_red.png",
        width: 90,
        height: 90,
      ): Image.asset(
        "assets/images/v_bed_green.png",
        width: 90,
        height: 90,
      ),
    );
  }
}

class SectionT0 extends StatelessWidget {
  final List<Bed> beds;

  SectionT0({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // First row with 4 beds
          Row(
            children: [
      HBedWidget(bed: beds[0]),
      HBedWidget(bed: beds[1]),
      HBedWidget(bed: beds[2]),
      HBedWidget(bed: beds[3]),
          ]),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Column(
               children: [
                 VBedWidget(bed: beds[4]),
                 VBedWidget(bed: beds[5]),
                 VBedWidget(bed: beds[6]),
               ],
             ),
              Column(
                children: [
                  Row(
                      children: [
                        HBedWidget(bed: beds[7]),
                        HBedWidget(bed: beds[8]),
                        HBedWidget(bed: beds[9]),
                      ]),

                  Row(
                      children: [
                        HBedWidget(bed: beds[10]),
                        HBedWidget(bed: beds[11]),
                        HBedWidget(bed: beds[12]),
                      ]),

                  Container(height: 30,),
                  Row(
                      children: [
                        HBedWidget(bed: beds[13]),
                        HBedWidget(bed: beds[14]),
                        HBedWidget(bed: beds[15]),
                      ]),

                  Row(
                      children: [
                        HBedWidget(bed: beds[16]),
                        HBedWidget(bed: beds[17]),
                        HBedWidget(bed: beds[18]),
                      ]),
                ],
              )
            ],
          ),

          Row(
              children: [
                HBedWidget(bed: beds[19]),
                HBedWidget(bed: beds[20]),
                HBedWidget(bed: beds[21]),
                HBedWidget(bed: beds[22]),
              ]),

        ],
      ),
    );
  }
}

class SectionT1 extends StatelessWidget {
  final List<Bed> beds;

  SectionT1({required this.beds});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // First row with 4 beds
          Row(
              children: [
                HBedWidget(bed: beds[0]),
                HBedWidget(bed: beds[1]),
                HBedWidget(bed: beds[2]),

              ]),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  VBedWidget(bed: beds[4]),
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
                              HBedWidget(bed: beds[7]),
                              HBedWidget(bed: beds[8]),

                            ]),

                        Row(
                            children: [
                              HBedWidget(bed: beds[10]),
                              HBedWidget(bed: beds[11]),
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
                              HBedWidget(bed: beds[13]),
                              HBedWidget(bed: beds[14]),

                            ]),

                        Row(
                            children: [
                              HBedWidget(bed: beds[16]),
                              HBedWidget(bed: beds[17]),
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
                HBedWidget(bed: beds[19]),
                HBedWidget(bed: beds[20]),
                HBedWidget(bed: beds[21]),

              ]),

        ],
      ),
    );
  }
}

// Main App Widget
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Bed> beds = List.generate(
      25,
          (index) => Bed(
        id: index.toString(),
        name: 'Bed ${index + 1}',
        isReserved: index == 1 || index == 6 || index==12|| index==18 || index==22 ? true : null, // Specify indices where isReserved should be true
      ),
    );

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Beds Layout')),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SectionT0(beds: beds),
                Container(height: 30,),
                SectionT1(beds: beds),
              ],
            ),
          ),
        ),
      );
  }
}
