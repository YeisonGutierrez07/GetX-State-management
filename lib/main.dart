import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/pages/reactive_page.dart';
import 'package:getx_state_management/pages/splash_page.dart';

import 'controllers/global_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
      title: 'Wixu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashPage(),
      home: ReactivePage(),
    );
  }
}
