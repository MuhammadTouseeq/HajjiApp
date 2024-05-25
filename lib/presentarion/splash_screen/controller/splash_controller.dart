import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:package_info/package_info.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
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
  initPackageInfo();

  Future.delayed(Duration(seconds: 3), () async{

   // Get.toNamed(AppRoutes.onboardingScreen);
   // Get.toNamed(AppRoutes.homeOneScreen);

  });
  }



}
