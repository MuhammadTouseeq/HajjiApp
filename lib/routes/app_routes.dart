import 'package:get/get_navigation/src/routes/get_route.dart';


import '../presentarion/dashboard_screen/binding/dashboard_binding.dart';
import '../presentarion/dashboard_screen/dashboard_screen.dart';
import '../presentarion/eventselection_screen/binding/eventselection_binding.dart';
import '../presentarion/eventselection_screen/eventselection_screen.dart';
import '../presentarion/login_screen/binding/login_binding.dart';
import '../presentarion/login_screen/login_screen.dart';
import '../presentarion/notification_screen/binding/notification_binding.dart';
import '../presentarion/notification_screen/notification_screen.dart';
import '../presentarion/onground_screen/binding/onground_binding.dart';
import '../presentarion/onground_screen/onground_screen.dart';
import '../presentarion/otp_screen/binding/otp_binding.dart';
import '../presentarion/otp_screen/otp_screen.dart';
import '../presentarion/reservedbed_screen/binding/reservedbed_binding.dart';
import '../presentarion/reservedbed_screen/reservedbed_screen.dart';
import '../presentarion/splash_screen/binding/splash_binding.dart';
import '../presentarion/splash_screen/splash_screen.dart';
import '../presentarion/user_information_screen/binding/user_information_binding.dart';
import '../presentarion/user_information_screen/user_information_screen.dart';

class AppRoutes {
 // static const String menuPage = '/menu_page';

  static const String menuContainerScreen = '/menu_container_screen';

  static const String splashScreen = '/splash_screen';
  static const String loginPage = '/login_screen';
  static const String otpPage = '/otp_screen';
  static const String userInformationPage = '/user_information_screen';
  static const String dashboradPage = '/Dashboard_screen';
  static const String reservedbedPage = '/reservedbed_screen';
  static const String notificationPage = '/Notification_screen';
  static const String ongroundPage = '/onground_screen';
  static const String eventSelectionPage = '/eventselection_screen';


  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [

    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),

    GetPage(
      name: loginPage,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: dashboradPage,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),




    GetPage(
      name: notificationPage,
      page: () => NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: eventSelectionPage,
      page: () => EventSelectionScreen(),
      bindings: [
        EventSelectionBinding(),
      ],
    ),
    GetPage(
      name: ongroundPage,
      page: () => OngroundScreen(),
      bindings: [
        OngroundBinding(),
      ],
    ),
    GetPage(
      name: reservedbedPage,
      page: () => ReservedbedScreen(),
      bindings: [
        ReservedbedBinding(),
      ],
    ),
    GetPage(
      name: otpPage,
      page: () => OtpScreen(),
      bindings: [
        OtpBinding(),
      ],
    ),
    GetPage(
      name: userInformationPage,
      page: () => UserInformationScreen(),
      bindings: [
        UserInformationBinding(),
      ],
    ),



  ];
}
