import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_state_management/controllers/home_controller.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "text",
      builder: (_) => Text(
        _.count.toString(),
      ),
    );
  }
}
