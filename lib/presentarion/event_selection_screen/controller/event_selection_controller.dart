import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
import '../../../localization/strings_enum.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/paginations/paged_view.dart';

/// A controller class for the DiscoverScreen.
///
/// This class manages the state of the DiscoverScreen, including the
/// current discoverModelObj
///
///
class RxNullable<T> {
  Rx<T> setNull() => (null as T).obs;
}
class EventSelectionController extends GetxController {
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final GlobalKey <PagedViewState> pageKey = GlobalKey();
  Rx<ApiCallStatus> apiCallStatus2 = ApiCallStatus.success.obs;
  ApiCallStatus apiCallStatus1 = ApiCallStatus.holding;
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.success.obs;
  RxList<EventsModel> eventcategory = <EventsModel>[].obs;
 // final Rx<EventsModel?> selectedproduction = RxNullable<EventsModel?>().setNull();
  RxList<Events> findEventsCategories = <Events>[].obs;
  AppPreferences _appPreferences = AppPreferences();
  ManagerLoginModel? userDetails;
  final Rx<Events?> myEvents = Rx<Events?>(null);

  // Rx<DiscoverModel> discoverModelObj = DiscoverModel().obs;

  // LoginModel? userDetails;
  //
  Future<dynamic> getProfileData() async {
    await _appPreferences.isPreferenceReady;
    var data= await _appPreferences.getProfileData();
    Map<String,dynamic> userMap = jsonDecode(data!);
    print('map $userMap');

    userDetails = ManagerLoginModel.fromJson(userMap);
    print('map1 $userDetails');

    UpdateDeviceToken();
  }

  Future<dynamic> getevetsApi({bool isRefresh = false}) async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;

        apiCallStatus.value = ApiCallStatus.loading;

        await _appPreferences.isPreferenceReady;
        _appPreferences.getAccessToken(
            prefName: AppPreferences.prefAccessToken).then((token) async {
          print(token);

          await BaseClient.get(
              "https://haaji.website/events?user_id=1&session_code=5f68335b6d310fde7bfdd58c36aac9",
              onSuccess: (response) {
                print(response);

                Iterable list = response.data['data']['events'];


                eventcategory.value= list.map((model) => EventsModel.fromJson(model)).toList();

                print('[ picture categories RESPONSE ===> ${eventcategory.toJson()}]');

                apiCallStatus.value = ApiCallStatus.success;

                return true;
              },
              onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },


              // headers: {
              //   'Authorization': 'Bearer $token'
              // },
              queryParameters: null

          );
        });
      } else {
        isInternetAvailable.value = false;
      }
    });
  }

  Future<dynamic> getEventsApi1({bool isRefresh = false}) async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;

        await BaseClient.get(
          '${Constants.eventsUrl}?user_id=${userDetails!.userId.toString()}&session_code=${userDetails!.sessionCode.toString()}',
          onSuccess: (response) {
            print("events data check ${response}");
            List<Events> dataEvents = [];
            if (response.data['status'] == true) {
            var jsonData=  response.data['data'];
              jsonData['events'].forEach((v) {
                dataEvents.add(new Events.fromJson(v));
              });
             print("Events Data  ==${dataEvents.length}");
            findEventsCategories.value=dataEvents;
            } else {
              Utils.showToast('', true);
              // Handle the case where data is null in the response
            }

          },
          onError: (error) {
            ApiException apiException = error;
            print(apiException.message);
            BaseClient.handleApiError(error);
            apiCallStatus.value = ApiCallStatus.error;
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

  Future<void> UpdateDeviceToken() async {


    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          print("Device Token $token");
          await BaseClient.post(Constants.deviceToken,
              onSuccess: (response) async {

              }, onError: (error) {
                BaseClient.handleApiError(error);
                // apiCallStatus = ApiCallStatus.error;
              }, data: {
                "user_id": userDetails?.userId,
                'device_type': (Platform.isIOS) ? 'ios' : 'android',
                "session_code": userDetails?.sessionCode,
                'device_token': token
              });
        });
      } else {
        CustomSnackBar.showCustomErrorToast(
          message: Strings.noInternetConnection.tr,
        );
      }
    });
  }

}
