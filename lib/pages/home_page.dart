import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_state_management/controllers/home_controller.dart';

import 'home_page_widgets/home_list_users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        print("Home reload");
        return Scaffold(
          body: HomeListUsers(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _.increment();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
