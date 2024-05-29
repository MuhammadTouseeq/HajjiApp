import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
import '../../../widgets/paginations/paged_view.dart';

/// A controller class for the DiscoverScreen.
///
/// This class manages the state of the DiscoverScreen, including the
/// current discoverModelObj
///
class DashboardController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController btn1Controller = RoundedLoadingButtonController();
 // Rx<DiscoverModel> discoverModelObj = DiscoverModel().obs;
  AppPreferences _appPreferences = AppPreferences();
 // AppPreferences appPreferences = AppPreferences();
  LoginModel? userDetails;
  RxBool isLoading = true.obs;
  Future<void> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data = await _appPreferences.getProfileData();
    if (data != null) {
      Map<String, dynamic> userMap = jsonDecode(data);
      userDetails = LoginModel.fromJson(userMap);
    }
    isLoading.value = false;
  }

  // Future<dynamic> getProfileData() async {
  //   await _appPreferences.isPreferenceReady;
  //   var data= await _appPreferences.getProfileData();
  //   Map<String,dynamic> userMap = jsonDecode(data!);
  //   print('map $userMap');
  //
  //   userDetails = LoginModel.fromJson(userMap);
  //   print('map1 $userDetails');
  // }







  @override
  void onInit() {
    super.onInit();
    getProfileData();

  }


}
