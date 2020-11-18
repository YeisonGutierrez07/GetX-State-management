import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_state_management/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${_.user.firstName} ${_.user.lastName}"),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CupertinoTextField(
                  onChanged: _.onInputTextChange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CupertinoButton(
                  child: Text("Aceptar"),
                  onPressed: () => _.goToBackWhithData(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
