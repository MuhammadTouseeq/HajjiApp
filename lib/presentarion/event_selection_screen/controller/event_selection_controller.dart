import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/model_classes/deal_model.dart';
import '../../../core/model_classes/events_model.dart';
import '../../../core/model_classes/login_model.dart';
import '../../../core/model_classes/manager_login_model.dart';
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
class EventSelectionController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final GlobalKey <PagedViewState> pageKey = GlobalKey();
  Rx<ApiCallStatus> apiCallStatus2 = ApiCallStatus.success.obs;
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.success.obs;
  RxList<EventsModel> eventcategory = <EventsModel>[].obs;

  AppPreferences _appPreferences = AppPreferences();
  ManagerLoginModel? userDetails;

  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('map $userMap');

    userDetails = ManagerLoginModel.fromJson(userMap);
    print('map1 $userDetails');
  }





  // Future<PageModel<EventsModel>?> getEventsApi(int page,) async {
  //   PageModel<EventsModel>? categories;
  //   Completer<PageModel<EventsModel>?> completer = Completer();
  //
  //   Utils.check().then((value) async {
  //     if (value) {
  //       isInternetAvailable.value = true;
  //       apiCallStatus.value = ApiCallStatus.loading;
  //
  //         await BaseClient.get(
  //             '${Constants.eventsUrl}?user_id=${userDetails!.userId.toString()}&session_code=${userDetails!.sessionCode.toString()}',
  //             onSuccess: (response) {
  //           var jsonData = response.data;
  //           if (jsonData is Map<String, dynamic>) {
  //             var data = jsonData['data'];
  //             if (data is List<dynamic>) {
  //               var eventModels = data.map((item) => EventsModel.fromJson(item)).toList();
  //
  //               // Rest of your code...
  //             } else {
  //               print("Invalid 'data' field format: $data");
  //               return false;
  //             }
  //           } else {
  //             print("Invalid response format: $jsonData");
  //             return false;
  //           }
  //         });
  //
  //     } else {
  //       isInternetAvailable.value = false;
  //     }
  //   });
  //
  //   return completer.future;
  // }


  Future<dynamic> getEventsApi1({bool isRefresh = false}) async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;

        await BaseClient.get(
         // "https://haaji.website/events?user_id=1&session_code=e0cf74ce372d0b141e6bfc7a56cb8c",
          '${Constants.eventsUrl}?user_id=${userDetails!.userId.toString()}&session_code=${userDetails!.sessionCode.toString()}',
          onSuccess: (response) {
            print("events data check ${response}");

            // Ensure response.data['events'] is an Iterable
            if (response.data['events'] is Iterable) {
              Iterable list = response.data['events'];
              eventcategory.value = list.map((model) => EventsModel.fromJson(model)).toList();
              print('[ categories RESPONSE ===> ${eventcategory.toJson()}]');
              apiCallStatus.value = ApiCallStatus.success;
            } else {


              apiCallStatus.value = ApiCallStatus.error;
            }
            return true;
          },
          onError: (error) {
            ApiException apiException = error;
            print(apiException.message);
            BaseClient.handleApiError(error);
            apiCallStatus.value = ApiCallStatus.error;
            return false;
          },
        );
      } else {
        isInternetAvailable.value = false;
      }
    });
  }










  @override
  void onInit() {
    super.onInit();
    getProfileData();
    getEventsApi1();
   // getEventsApi(1);



  }


}
