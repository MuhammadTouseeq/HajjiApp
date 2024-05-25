import '../controller/reservedbed_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiscoverScreen.
///
/// This class ensures that the DiscoverController is created when the
/// DiscoverScreen is first loaded.
class ReservedbedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservedbedController());
  }
}
