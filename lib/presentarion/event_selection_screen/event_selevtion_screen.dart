import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/image_constant.dart';
import 'package:hajjiapp/widgets/common_image_view.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../../core/model_classes/events_model.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/animated_custom_button.dart';
import '../../widgets/paginations/paged_gridview.dart';
import '../../widgets/widgets_shimmer.dart';
import 'controller/event_selection_controller.dart';

class EventSelectionScreen extends StatelessWidget {
  EventSelectionController controller = Get.put(EventSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.textfieldborder,
      appBar: AppBar(
        backgroundColor: ColorConstant.aappbarColor,
        title: Padding(
          padding: getPadding(left: 50,),
          child: MyText(title: 'Event Selection',fontSize: 16,customWeight: FontWeight.bold,),
        ),
       // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorConstant.black900,),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),


      ),
      body: Padding(
        padding: getPadding(all: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getVerticalSize(30),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              // PaginatedGridView<EventsModel>(
              // key: controller.pageKey,
              //   initialLoader: shimmerCategoryFeature(context),
              //   onDispose: (list) {
              //     print("list on dispose: ${list?.total_page}");
              //   },
              //   onFetchPage: (int page) {
              //     return controller.getEventsApi(page);
              //   },
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   crossAxisCount: 2,
              //   childAspectRatio: 1.0,
              //   mainAxisExtent: 300,
              //   crossAxisSpacing: 0,
              //   mainAxisSpacing: 0,
              //   itemBuilder: (ind, item) {
              //     item as EventsModel;
              //     print("item  $item");
              //
              //     return GestureDetector(
              //       onTap: () {
              //         // Handle tap
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.all(5.0), // Adjust the padding as needed
              //         child: Container(
              //           padding: EdgeInsets.all(3),
              //           decoration: BoxDecoration(
              //             color: ColorConstant.whiteA700,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Column(
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
              //                 child: CommonImageView(
              //                   url: item.eventImage ?? ImageConstant.imageNotFoundProfile,
              //                   fit: BoxFit.cover,
              //                   height: 150,
              //                   width: double.infinity,
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Padding(
              //                   padding: EdgeInsets.only(left: 5),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       SizedBox(height: 5),
              //                       MyText(title: item.eventName ?? "N/A"),
              //                       SizedBox(height: 5),
              //                       Row(
              //                         children: [
              //                           Container(
              //                             height: 5,
              //                             width: 5,
              //                             decoration: BoxDecoration(
              //                               color: ColorConstant.blackColor,
              //                               borderRadius: BorderRadius.circular(100),
              //                             ),
              //                           ),
              //                           SizedBox(width: 10),
              //                           MyText(title: item.eventStartDate ?? "N/A", fontSize: 14),
              //                         ],
              //                       ),
              //                       SizedBox(height: 5),
              //                       Row(
              //                         children: [
              //                           Container(
              //                             height: 5,
              //                             width: 5,
              //                             decoration: BoxDecoration(
              //                               color: ColorConstant.blackColor,
              //                               borderRadius: BorderRadius.circular(100),
              //                             ),
              //                           ),
              //                           SizedBox(width: 10),
              //                           MyText(title: item.eventStartTime ?? "N/A", fontSize: 14),
              //                         ],
              //                       ),
              //                       SizedBox(height: 5),
              //                       Row(
              //                         children: [
              //                           Container(
              //                             height: 5,
              //                             width: 5,
              //                             decoration: BoxDecoration(
              //                               color: ColorConstant.green1,
              //                               borderRadius: BorderRadius.circular(100),
              //                             ),
              //                           ),
              //                           SizedBox(width: 10),
              //                           MyText(
              //                             title: "Total Registered ${item.totalHaaji ?? '0'}",
              //                             fontSize: 14,
              //                             clr: ColorConstant.green1,
              //                           ),
              //                         ],
              //                       ),
              //                       SizedBox(height: 5),
              //                       Row(
              //                         children: [
              //                           Container(
              //                             height: 5,
              //                             width: 5,
              //                             decoration: BoxDecoration(
              //                               color: ColorConstant.orange1,
              //                               borderRadius: BorderRadius.circular(100),
              //                             ),
              //                           ),
              //                           SizedBox(width: 10),
              //                           MyText(
              //                             title: "Remaining ${item.haajiAttendanceRemaining ?? '0'}",
              //                             fontSize: 14,
              //                             clr: ColorConstant.orange1,
              //                           ),
              //                         ],
              //                       ),
              //                       SizedBox(height: 5),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),

                  RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(const Duration(seconds: 2), () {

                      });
                    },
                    child: Obx(() {
                      if (controller.apiCallStatus2.value == ApiCallStatus.loading) {
                        return shimmerCategoryFeature(context);
                      } else if (controller.apiCallStatus2.value == ApiCallStatus.error) {
                        return shimmerCategoryFeature(context);
                      } else {
                        return controller.eventcategory.isEmpty
                            ? Center(
                          child:  Center(
                              child:
                              MyText(
                                title: "No Events Found",
                                fontSize: 25,
                              )
                          ),
                        )
                            :   GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 300,
                          ),
                          itemCount: controller.eventcategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                // Handle tap
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0), // Adjust the padding as needed
                                child: Container(
                                  padding: getPadding(all: 3),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                        child: CommonImageView(
                                          imagePath: ImageConstant.minahImage,
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: double.infinity,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: getPadding(left: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: getVerticalSize(5)),
                                              MyText(title: controller.eventcategory[index].events?[index].eventId ?? "N/A"),
                                              SizedBox(height: getVerticalSize(5)),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant.blackColor,
                                                        borderRadius: BorderRadius.circular(100)
                                                    ),
                                                  ),
                                                  SizedBox(width: getVerticalSize(10),),
                                                  MyText(title:"N/A", fontSize: 14),
                                                ],
                                              ),
                                              SizedBox(height: getVerticalSize(5)),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant.blackColor,
                                                        borderRadius: BorderRadius.circular(100)
                                                    ),
                                                  ),
                                                  SizedBox(width: getVerticalSize(10),),
                                                  MyText(title: "N/A", fontSize: 14),
                                                ],
                                              ),
                                              SizedBox(height: getVerticalSize(5)),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant.green1,
                                                        borderRadius: BorderRadius.circular(100)
                                                    ),
                                                  ),
                                                  SizedBox(width: getVerticalSize(10),),
                                                  MyText(title: "N/A", fontSize: 14,clr:  ColorConstant.green1,),
                                                ],
                                              ),
                                              SizedBox(height: getVerticalSize(5)),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant.orange1,
                                                        borderRadius: BorderRadius.circular(100)
                                                    ),
                                                  ),
                                                  SizedBox(width: getVerticalSize(10),),
                                                  MyText(title:  "N/A", fontSize: 14,clr: ColorConstant.orange1,),
                                                ],
                                              ),
                                              SizedBox(height: getVerticalSize(5)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
                  ),


        // GridView.builder(
        //             padding: EdgeInsets.zero,
        //             physics: const NeverScrollableScrollPhysics(),
        //             shrinkWrap: true,
        //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               crossAxisSpacing: 0,
        //               mainAxisSpacing: 0,
        //               mainAxisExtent: 300,
        //             ),
        //             itemCount: 2,
        //             itemBuilder: (BuildContext context, int index) {
        //               return GestureDetector(
        //                 onTap: () {
        //                   // Handle tap
        //                 },
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(5.0), // Adjust the padding as needed
        //                   child: Container(
        //                     padding: getPadding(all: 3),
        //                     decoration: BoxDecoration(
        //                       color: ColorConstant.whiteA700,
        //                       borderRadius: BorderRadius.circular(10),
        //                     ),
        //                     child: Column(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        //                           child: CommonImageView(
        //                             imagePath: ImageConstant.minahImage,
        //                             fit: BoxFit.cover,
        //                             height: 150,
        //                             width: double.infinity,
        //                           ),
        //                         ),
        //                         Expanded(
        //                           flex: 1,
        //                           child: Padding(
        //                             padding: getPadding(left: 5),
        //                             child: Column(
        //                               crossAxisAlignment: CrossAxisAlignment.start,
        //                               children: [
        //                                 SizedBox(height: getVerticalSize(5)),
        //                                 MyText(title: "Minah"),
        //                                 SizedBox(height: getVerticalSize(5)),
        //                                 Row(
        //                                   children: [
        //                                    Container(
        //                                      height: 5,
        //                                      width: 5,
        //                                      decoration: BoxDecoration(
        //                                        color: ColorConstant.blackColor,
        //                                        borderRadius: BorderRadius.circular(100)
        //                                      ),
        //                                    ),
        //                                     SizedBox(width: getVerticalSize(10),),
        //                                     MyText(title: "22 June 2024", fontSize: 14),
        //                                   ],
        //                                 ),
        //                                 SizedBox(height: getVerticalSize(5)),
        //                                 Row(
        //                                   children: [
        //                                     Container(
        //                                       height: 5,
        //                                       width: 5,
        //                                       decoration: BoxDecoration(
        //                                           color: ColorConstant.blackColor,
        //                                           borderRadius: BorderRadius.circular(100)
        //                                       ),
        //                                     ),
        //                                     SizedBox(width: getVerticalSize(10),),
        //                                     MyText(title: "10:30 am", fontSize: 14),
        //                                   ],
        //                                 ),
        //                                 SizedBox(height: getVerticalSize(5)),
        //                                 Row(
        //                                   children: [
        //                                     Container(
        //                                       height: 5,
        //                                       width: 5,
        //                                       decoration: BoxDecoration(
        //                                           color: ColorConstant.green1,
        //                                           borderRadius: BorderRadius.circular(100)
        //                                       ),
        //                                     ),
        //                                     SizedBox(width: getVerticalSize(10),),
        //                                     MyText(title: "Total Registered 250", fontSize: 14,clr:  ColorConstant.green1,),
        //                                   ],
        //                                 ),
        //                                 SizedBox(height: getVerticalSize(5)),
        //                                 Row(
        //                                   children: [
        //                                     Container(
        //                                       height: 5,
        //                                       width: 5,
        //                                       decoration: BoxDecoration(
        //                                           color: ColorConstant.orange1,
        //                                           borderRadius: BorderRadius.circular(100)
        //                                       ),
        //                                     ),
        //                                     SizedBox(width: getVerticalSize(10),),
        //                                     MyText(title: "Remaining 150", fontSize: 14,clr: ColorConstant.orange1,),
        //                                   ],
        //                                 ),
        //                                 SizedBox(height: getVerticalSize(5)),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             },
        //           )


                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}

