import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_state_management/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _initialCount();
  }

  void _initialCount() {
    print("HOLA");
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }

  @override
  void onClose() {
    super.onClose();
    print("Close Widget");
  }
}
