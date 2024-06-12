import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hajjiapp/routes/app_routes.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/utils/fcm_helper.dart';
import 'core/utils/initial_bindings.dart';
import 'core/utils/logger.dart';
import 'core/utils/size_utils.dart';
import 'data/services/my_shared_pref.dart';
import 'firebase_options.dart';
import 'localization/app_localization.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light,);
  WidgetsFlutterBinding.ensureInitialized();


  // await Firebase.initializeApp();

  Platform.isIOS?await Firebase.initializeApp(
    name: 'hajji_app',
    options: DefaultFirebaseOptions.ios,
  ):await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  // init shared preference
  await MySharedPref.init();

  // inti fcm & notifications services (awesome notifications)
  await FcmHelper.initFcm();

  await Permission.location.request();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'hajji app',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.signInPage,
        getPages: AppRoutes.pages,
      );
    });
  }
}