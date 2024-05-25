import '../controller/user_information_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginScreen.
///
/// This class ensures that the LoginController is created when the
/// LoginScreen is first loaded.
class UserInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInformationController());
  }
}
