import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hajjiapp/presentarion/event_selection_screen/binding/event_selection_binding.dart';
import 'package:hajjiapp/presentarion/event_selection_screen/event_selevtion_screen.dart';
import 'package:hajjiapp/presentarion/hajji_attendance_screen/binding/hajji_attendance_binding.dart';
import 'package:hajjiapp/presentarion/hajji_attendance_screen/hajji_attendance_screen.dart';
import 'package:hajjiapp/presentarion/signin_screen/signin_screen.dart';
import '../presentarion/dashboard_screen/binding/dashboard_binding.dart';
import '../presentarion/dashboard_screen/dashboard_screen.dart';

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
import '../presentarion/sections_screen/binding/eventselection_binding.dart';
import '../presentarion/sections_screen/eventselection_screen.dart';
import '../presentarion/signin_screen/binding/signin_binding.dart';
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
  static const String sectionsPage = '/sections_screen';
  static const String signInPage = '/signin_screen';
  static const String eventSelectionPage = '/event_selection_screen';
  static const String hajjiAttendancePage = '/hajji_attendance_screen';


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
      name: eventSelectionPage,
      page: () => EventSelectionScreen(),
      bindings: [
        EventSelectionBinding(),
      ],
    ),
    GetPage(
      name: signInPage,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: hajjiAttendancePage,
      page: () => HajjiAttendanceScreen(),
      bindings: [
        HajjiAttendanceBinding(),
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
      name: sectionsPage,
      page: () => SectionsScreen(),
      bindings: [
        SectionsBinding(),
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
