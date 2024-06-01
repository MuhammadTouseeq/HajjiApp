import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/presentarion/sections_screen/section57.dart';
import 'package:hajjiapp/presentarion/sections_screen/section11.dart';
import 'package:hajjiapp/presentarion/sections_screen/section13.dart';
import 'package:hajjiapp/presentarion/sections_screen/section51.dart';
import 'package:hajjiapp/presentarion/sections_screen/section40.dart';
import 'package:hajjiapp/presentarion/sections_screen/section19.dart';
import 'package:hajjiapp/presentarion/sections_screen/section2.dart';
import 'package:hajjiapp/presentarion/sections_screen/section20.dart';
import 'package:hajjiapp/presentarion/sections_screen/section60.dart';
import 'package:hajjiapp/presentarion/sections_screen/section32.dart';
import 'package:hajjiapp/presentarion/sections_screen/section35.dart';
import 'package:hajjiapp/presentarion/sections_screen/section36.dart';
import 'package:hajjiapp/presentarion/sections_screen/section5.dart';
import 'package:hajjiapp/presentarion/sections_screen/section6.dart';
import 'package:hajjiapp/presentarion/sections_screen/section52.dart';
import 'package:hajjiapp/presentarion/sections_screen/section8.dart';
import 'package:hajjiapp/presentarion/sections_screen/section9.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/utils.dart';
import '../../section_screen.dart';
import '../../widgets/animated_custom_button.dart';
import 'controller/sectioons_controller.dart';
import 'custom_ac.dart';
import 'models/sections_model.dart';

class SectionsScreen extends StatelessWidget {
  SectionsController controller = Get.put(SectionsController());

  @override
  Widget build(BuildContext context) {
    // List<Bed> beds = List.generate(
    //   25,
    //       (index) => Bed(
    //     id: index.toString(),
    //     name: 'Bed ${index + 1}',
    //     isReserved: index == 1 || index == 6 || index==12|| index==18 || index==22 ? true : null, // Specify indices where isReserved should be true
    //   ),
    // );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorConstant.aappbarColor,
          title: Padding(
            padding: getPadding(left: 0,),
            child: MyText(title: 'Event Selection',fontSize: 18,customWeight: FontWeight.bold,),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: ColorConstant.black900,),
            onPressed: () {
              // Handle back button press
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: ColorConstant.pinkcolor,
                      padding: getPadding(all: 10),
                      child: MyText(
                        title: "Booked",
                        clr: ColorConstant.whiteA700,
                        center: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: ColorConstant.greencolor,
                      padding: getPadding(all: 10),
                      child: MyText(
                        title: "Available",
                        clr: ColorConstant.whiteA700,
                        center: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: ColorConstant.bluecolor,
                      padding: getPadding(all: 10),
                      child: MyText(
                        title: "You Selected",
                        clr: ColorConstant.whiteA700,
                        center: true,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: getPadding(all: 10),
                color: ColorConstant.appBackgroundgrayColor,
                child: MyText(
                  center: true,
                  title: 'Click on bed to reserve',
                ),
              ),
              Obx(() => Container(
                padding: getPadding(left: 10),
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.dropdowncolor,
                  border: Border.all(color: Colors.grey), // Add border decoration
                  borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                ),
                child: DropdownButton<String>(
                  //  isExpanded: false,
                  hint: Text(
                    "Select Camp",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ), // Set the hint text
                  iconSize: 35,
                  iconEnabledColor: ColorConstant.blackColor,
                  iconDisabledColor: ColorConstant.appDescriptionTextColor,
                  underline: SizedBox(),
                  value: controller.selectedValueConditions.value.isNotEmpty ? controller.selectedValueConditions.value : null,
                  items: controller.sections.value.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: MyText(
                        title: item,
                        clr: ColorConstant.black900,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.selectedValueConditions.value = newValue;
                      controller.getBedsData(controller.selectedValueConditions.value);
                    }
                  },
                ),
              )),
              Obx(() {
                if (controller.availableBedList.value != null && controller.availableBedList.value.isNotEmpty) {
                  return InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(8.0),
                    minScale: 0.1,
                    maxScale: 40.0,
                    child: Padding(
                      padding: getPadding(all: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Section3(beds: controller.generateBedList.value),
                      ),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),

              // SizedBox(height: getVerticalSize(100),),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     child: Section3(beds: controller.generateBedList),
              //   ),
              // ),
              SizedBox(height: getVerticalSize(10),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyAnimatedButton(
                  radius: 25.0,
                  height: getVerticalSize(60),
                  width: getHorizontalSize(400),
                  fontSize: 20 ,
                  bgColor: ColorConstant.anbtnBlue,
                  controller: controller.btnController,
                  title: "View My Bed in Full Layout".tr,
                  onTap: () async {


                  },
                ),
              ),
              SizedBox(height: getVerticalSize(10),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyAnimatedButton(
                  radius: 25.0,
                  height: getVerticalSize(60),
                  width: getHorizontalSize(400),
                  fontSize: 20 ,
                  bgColor: ColorConstant.anbtnBlue,
                  controller: controller.btnController,
                  title: "View Full Layout".tr,
                  onTap: () async {

                  },
                ),
              ),

            ],
          ),
        ));
  }






}

class HBedWidget extends StatelessWidget {
  SectionsController controller = Get.put(SectionsController());

  final Bed bed;

  HBedWidget({required this.bed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(bed.isReserved==true) {
          Utils.showToast('Bed Already reserved', false);
        }
        else
        {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('Are you sure you want to reserve the bed number ${bed.id}.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the AlertDialog
                      Navigator.of(context).pop();
                      controller.reserveBed(bed.id as int);

                    },
                    child: Text('Confirm'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Stack(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 3),
            child:
            bed.isReserved==true?
            Image.asset(
              "assets/images/h_bed_red.png",
              width: 90,
              height: 90,
            ): Image.asset(
              "assets/images/h_bed_green.png",
              width: 90,
              height: 90,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: H_BedNumberStyle(bed: bed),
            ),
          )
        ],
      ),
    );
  }
}

class H_BedNumberStyle extends StatelessWidget {
  const H_BedNumberStyle({
    super.key,
    required this.bed,
  });

  final Bed bed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      margin: bed.isReserved!? EdgeInsets.only(  left: 20):EdgeInsets.only(  right: 20),

      decoration: BoxDecoration(
        color: Colors.red[300],
        shape: BoxShape.circle
      ),
      child: Center(child: Text(bed.id.toString(),style: TextStyle(fontSize: 10,color:Colors.white ),)),
    );
  }
}

class V_BedNumberStyle extends StatelessWidget {
  const V_BedNumberStyle({
    super.key,
    required this.bed,
  });

  final Bed bed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      margin: bed.isReserved!? EdgeInsets.only(  bottom: 20):EdgeInsets.only(  right: 0,top: 10),
      decoration: BoxDecoration(
          color: Colors.red[300],
          shape: BoxShape.circle
      ),
      child: Center(child: Text(bed.id.toString(),style: TextStyle(fontSize: 10,color:Colors.white ),)),
    );
  }
}

class VBedWidget extends StatelessWidget {
  SectionsController controller = Get.put(SectionsController());

  final Bed bed;

  VBedWidget({required this.bed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(bed.isReserved==true) {
          Utils.showToast('Bed Already reserved', false);
        }
        else
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert'),
                  content: Text('Are you sure you want to reserve the bed number ${bed.id}.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Close the AlertDialog
                        Navigator.of(context).pop();
                        controller.reserveBed(bed.id as int);

                      },
                      child: Text('Confirm'),
                    ),
                  ],
                );
              },
            );
          }
      },
      child: Stack(
        children: [
          Container(
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
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: V_BedNumberStyle(bed: bed),
            ),
          )
        ],
      ),
    );
  }
}

// class SectionT0 extends StatelessWidget {
//   final List<Bed> beds;
//
//   SectionT0({required this.beds});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         children: [
//           // First row with 4 beds
//           Row(
//               children: [
//                 HBedWidget(bed: beds[0]),
//                 HBedWidget(bed: beds[1]),
//                 HBedWidget(bed: beds[2]),
//                 HBedWidget(bed: beds[3]),
//               ]),
//
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   VBedWidget(bed: beds[4]),
//                   VBedWidget(bed: beds[5]),
//                   VBedWidget(bed: beds[6]),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Row(
//                       children: [
//                         HBedWidget(bed: beds[7]),
//                         HBedWidget(bed: beds[8]),
//                         HBedWidget(bed: beds[9]),
//                       ]),
//
//                   Row(
//                       children: [
//                         HBedWidget(bed: beds[10]),
//                         HBedWidget(bed: beds[11]),
//                         HBedWidget(bed: beds[12]),
//                       ]),
//
//                   Container(height: 30,),
//                   Row(
//                       children: [
//                         HBedWidget(bed: beds[13]),
//                         HBedWidget(bed: beds[14]),
//                         HBedWidget(bed: beds[15]),
//                       ]),
//
//                   Row(
//                       children: [
//                         HBedWidget(bed: beds[16]),
//                         HBedWidget(bed: beds[17]),
//                         HBedWidget(bed: beds[18]),
//                       ]),
//                 ],
//               )
//             ],
//           ),
//
//           Row(
//               children: [
//                 HBedWidget(bed: beds[19]),
//                 HBedWidget(bed: beds[20]),
//                 HBedWidget(bed: beds[21]),
//                 HBedWidget(bed: beds[22]),
//               ]),
//
//         ],
//       ),
//     );
//   }
// }

// class SectionT1 extends StatelessWidget {
//   final List<Bed> beds;
//
//   SectionT1({required this.beds});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         children: [
//           // First row with 4 beds
//           Row(
//               children: [
//                 HBedWidget(bed: beds[0]),
//                 HBedWidget(bed: beds[1]),
//                 HBedWidget(bed: beds[2]),
//
//               ]),
//
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   VBedWidget(bed: beds[4]),
//                   VBedWidget(bed: beds[5]),
//                 ],
//               ),
//               Container(width: 30,),
//               Column(
//                 children: [
//
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                             children: [
//                               HBedWidget(bed: beds[7]),
//                               HBedWidget(bed: beds[8]),
//
//                             ]),
//
//                         Row(
//                             children: [
//                               HBedWidget(bed: beds[10]),
//                               HBedWidget(bed: beds[11]),
//                             ]),
//
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                             children: [
//                               HBedWidget(bed: beds[13]),
//                               HBedWidget(bed: beds[14]),
//
//                             ]),
//
//                         Row(
//                             children: [
//                               HBedWidget(bed: beds[16]),
//                               HBedWidget(bed: beds[17]),
//                             ]),
//                       ],
//                     ),
//                   )
//
//                 ],
//               )
//             ],
//           ),
//
//           Row(
//               children: [
//                 HBedWidget(bed: beds[19]),
//                 HBedWidget(bed: beds[20]),
//                 HBedWidget(bed: beds[21]),
//
//               ]),
//
//         ],
//       ),
//     );
//   }
// }
