import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/state_manager.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  RxString get message => _message;

  Timer _timer;
  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _message.value = _faker.lorem.sentence();
    });
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.onClose();
  }
}
