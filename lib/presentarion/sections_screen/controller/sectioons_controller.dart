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

  // LoginModel? userDetails;
  //
  // Future<dynamic> getProfileData() async {
  //   await appPreferences.isPreferenceReady;
  //   var data= await appPreferences.getProfileData();
  //   Map<String,dynamic> userMap = jsonDecode(data!);
  //   print('map $userMap');
  //   userDetails = LoginModel.fromJson(userMap);
  // }
  final sectionData = <DataItem>[].obs;


  Future<void> getSectionData() async {

      Utils.check().then((value) async {
        if (value) {
          await BaseClient.post(
              Constants.sectionDataUrl,
              onSuccess: (response) async {

                apiCallStatus = ApiCallStatus.success;

                if (response.data['data'] != null) {

                  // Map<String, dynamic> parsedJson = jsonDecode(jsonData);

                  sectionData.value= List<DataItem>.from(response.data['data'].map((x) => DataItem.fromJson(x)));

                  // Now you can access the parsed data
                  print(sectionData.value[0].sectionNumber); // Output: 1
                  print(sectionData.value[0].type); // Output: Female
                  Utils.showToast(response.data['message'], false,);
                  print("masg ${response.data['message']}");
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
                {
                  "user_id": "778",
                  "session_code": "b6b845e9d24faffae128"
                }
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
