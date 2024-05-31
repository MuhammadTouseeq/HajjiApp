import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hajjiapp/presentarion/sections_screen/models/sections_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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
  // LoginModel? userDetails;
  //
  // Future<dynamic> getProfileData() async {
  //   await appPreferences.isPreferenceReady;
  //   var data= await appPreferences.getProfileData();
  //   Map<String,dynamic> userMap = jsonDecode(data!);
  //   print('map $userMap');
  //   userDetails = LoginModel.fromJson(userMap);
  // }

generateBedData({int count=24})
{
  print("available beds $availableBedList");
generateBedList.value= List.generate(
    count,
        (index) => Bed(
      id: index+1,
      name: 'Bed ${index + 1}',
      isReserved: availableBedList.contains((index+1).toString()) ? false : true, // Specify indices where isReserved should be true
    ),
  );
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

                response.data['data'].forEach((v) {
                  dataBeds.add(new BedData.fromJson(v));
                });

                bedList.value.clear();
                availableBedList.value.clear();
                bedList.value.addAll(dataBeds);
                generateBedList.value.clear();
                availableBedList.value.addAll(
                  bedList.value
                      .where((bedData) => bedData.isReserved != true) // Filter out reserved beds
                      .map((bedData) => bedData.bedNumber) // Extract the bed numbers
                      .toSet() // Remove duplicates
                      .toList(), // Convert to list
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
              "bed_number":bedNumber,
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
