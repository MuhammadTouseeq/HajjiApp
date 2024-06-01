import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hajjiapp/presentarion/sections_screen/models/sections_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/deal_model.dart';
import '../../../core/model_classes/login_model.dart';
import '../../../core/model_classes/page_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../localization/strings_enum.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/paginations/paged_view.dart';

/// A controller class for the DiscoverScreen.
///
/// This class manages the state of the DiscoverScreen, including the
/// current discoverModelObj
///
class SectionsController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

 // Rx<DiscoverModel> discoverModelObj = DiscoverModel().obs;
  late List<String> itemsContidions = [ ];
  final selectedValueConditions = ''.obs;

  RxList<DataItem> sectionList = List<DataItem>.empty().obs;
  RxList<String> sections = List<String>.empty().obs;
  RxList<BedData> bedList = List<BedData>.empty().obs;
  RxList<String?> availableBedList = List<String?>.empty().obs;
  RxList<Bed> generateBedList = List<Bed>.empty().obs;
  AppPreferences _appPreferences = AppPreferences();
  // AppPreferences appPreferences = AppPreferences();
  LoginModel? userDetails;
  RxBool isLoading = true.obs;
  RxBool isMyBed = false.obs;
  RxString mapURL = "".obs;
  RxString myBedMapURL = "".obs;

  Future<void> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data = await _appPreferences.getProfileData();
    if (data != null) {
      Map<String, dynamic> userMap = jsonDecode(data);
      userDetails = LoginModel.fromJson(userMap);
    }
    print("userdetails ${userDetails?.sessionCode}");
    isLoading.value = false;
  }


  clear()
  {
     isMyBed.value = true;
     mapURL.value = "";
     myBedMapURL.value = "";
  }
generateBedData1({int count=30})
{
  print("available beds $availableBedList");
generateBedList.value= List.generate(
    count,
        (index) => Bed(
      id: index+1,
      name: 'Bed ${index + 1}',
      mapURL: getMap(index+1),
      isMyBed: checkisMyBed(index+1),
      isReserved: isReserve(index), // Specify indices where isReserved should be true
    ),
  );
}

  void generateBedData({int count = 30}) {

    if(availableBedList.isEmpty)
      return;
    print("available beds $availableBedList");
    List<Bed> bedList = [];
    for (int index = 0; index < count; index++) {
      bedList.add(Bed(
        id: index + 1,
        name: 'Bed ${index + 1}',
        mapURL: getMap(index + 1),
        isMyBed: checkisMyBed(index + 1),
        isReserved: isReserve(index + 1),
      ));
    }
    generateBedList.value = bedList;
  }
  getMap(int index)
  {
    if(availableBedList.contains(index.toString()))
    {
      return  bedList.value[index].reservation_map;
    }
    return "";
  }


checkisMyBed(int index)
{
  if(availableBedList.contains(index.toString()))
    {
      if(bedList.value[index].isMyBed==true)
        {
isMyBed.value=true;
myBedMapURL.value=bedList.value[index].reservation_map!;
        }
    return  bedList.value[index].isMyBed;
    }
  isMyBed.value=false;
  return false;
}
  isReserve(int index)
  {
    if(availableBedList.contains(index.toString()))
    {
      return  bedList.value[index].isReserved;
    }
    return false;
  }

  Future<void> getSectionData() async {

      Utils.check().then((value) async {
        if (value) {
          await BaseClient.post(
              Constants.sectionDataUrl,
              onSuccess: (response) async {

                apiCallStatus = ApiCallStatus.success;
                 List<DataItem> dataSection = [];

                if (response.data['status'] == true) {

                    response.data['data'].forEach((v) {
                      dataSection.add(new DataItem.fromJson(v));
                    });

                    sections.value=dataSection.map((e) => e.sectionNumber).toSet().toList();
                    sectionList.value.addAll(dataSection);
                    sectionList.refresh();

                    selectedValueConditions.value=sections.value[0];
                    getBedsData(selectedValueConditions.value);

                } else {
                  Utils.showToast('', true);
                  // Handle the case where data is null in the response
                }
              },
              onError: (error) {

                BaseClient.handleApiError(error);
                apiCallStatus = ApiCallStatus.error;
              },


              data: {
                  "user_id": 778,
                  "session_code": "b6b845e9d24faffae128"
              }
          );

        } else {
          CustomSnackBar.showCustomErrorToast(
            message: Strings.noInternetConnection.tr,
          );
        }
      });

  }


  Future<void> getBedsData(String sectionNumber) async {
print("====section number ${sectionNumber}");
    Utils.check().then((value) async {
      if (value) {
        await BaseClient.post(
            Constants.bedDataUrl,
            onSuccess: (response) async {

              apiCallStatus = ApiCallStatus.success;
              List<BedData> dataBeds = [];
            print("Bed Api response========  ${response.data['data']}");
              if (response.data['status'] == true) {
                clear();
              mapURL.value = response.data['reservation_map'] ;
              print("maping url========  ${mapURL.value}");

              response.data['data'].forEach((v) {
                  dataBeds.add(new BedData.fromJson(v));
                });

                bedList.value.clear();
                availableBedList.value.clear();
                bedList.value.addAll(dataBeds);
                bedList.value.addAll(dataBeds);
                generateBedList.value.clear();
                availableBedList.value.addAll(
                  bedList.value
                      // .where((bedData) => bedData.isReserved != true) // Filter out reserved beds
                      .map((bedData) => bedData.bedNumber) // Extract the bed numbers
                      .toSet() // Remove duplicates
                      .toList(), // Convert to list/
                );
               // availableBedList.value.addAll(bedList.value.map((bedData) => bedData.bedNumber).toSet().toList());
                availableBedList.refresh();
                bedList.refresh();
                generateBedData();
              } else {
                Utils.showToast('', true);
                // Handle the case where data is null in the response
              }
            },
            onError: (error) {

              BaseClient.handleApiError(error);
              apiCallStatus = ApiCallStatus.error;
            },


            data: {
              "user_id": 778,
              "session_code": "b6b845e9d24faffae128",
              "section_number":sectionNumber
            }
        );

      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });

  }

  launchURL(String url) async {
    print("url===$url");
if(url.isEmpty)
  return;

    // if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  Future<void> reserveBed(int bedNumber) async {

    Utils.check().then((value) async {
      if (value) {
        await BaseClient.post(
            Constants.reserveBedUrl,
            onSuccess: (response) async {

              apiCallStatus = ApiCallStatus.success;
              List<BedData> dataBeds = [];
              print("Bed Api response========  ${response}");
              if (response.data['status'] == true) {
                CustomSnackBar.showCustomToast(
                  message:response.data['message'],
                );
                availableBedList.clear();
                getBedsData(selectedValueConditions.value);
              } else {
                CustomSnackBar.showCustomErrorToast(
                  message:response.data['message'],
                );
                // Handle the case where data is null in the response
              }
            },
            onError: (error) {

              BaseClient.handleApiError(error);
              apiCallStatus = ApiCallStatus.error;
            },


            data: {
              "user_id": 778,
              "session_code": "b6b845e9d24faffae128",
              "section_number":selectedValueConditions.value,
              "bed_number":bedNumber+1,
            }
        );

      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });

  }




  @override
  void onInit() {
    super.onInit();

getSectionData();


  }


}
