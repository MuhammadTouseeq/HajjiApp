import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:package_info/package_info.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../routes/app_routes.dart';
import '../../../service/local_database.dart';
import '../models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  AppPreferences appPreferences = AppPreferences();

  Rx<PackageInfo> packageInfo = PackageInfo(
    appName: 'autoapp',
    packageName: 'Unknown',
    version: '1.0.1',
    buildNumber: 'Unknown',
  ).obs;

  Future<void> initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo.value = info;
  }



  @override
  void onInit() {
  super.onInit();

  getRoute();

  }

  Future<void> getRoute() async {
    await appPreferences.isPreferenceReady;
    appPreferences.getIsLoggedIn().then((value) async => {
      print('getIsLoggedIn $value'),
      await Future.delayed(3000.milliseconds),


      if(value==null || !value){
        Get.offAndToNamed(AppRoutes.loginPage),
      }
      else {
        Get.offAllNamed(AppRoutes.dashboradPage)
      }
    }).catchError((err) async {
      await Future.delayed(3000.milliseconds);
      Get.offAndToNamed(AppRoutes.loginPage);
    });
  }



}
