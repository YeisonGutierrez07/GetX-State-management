import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_state_management/models/user.dart';

class ProfileController extends GetxController {
  UserModel _user;

  UserModel get user => _user;
  String _inputText = '';

  @override
  void onInit() {
    super.onInit();

    this._user = Get.arguments as UserModel;
  }

  void onInputTextChange(String text) {
    this._inputText = text;
  }

  void goToBackWhithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      // Alert Cupertino
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (_) => CupertinoActionSheet(
          title: Text("Error"),
          message: Text("Ingrese un valor válido"),
          cancelButton: CupertinoActionSheetAction(
            child: Text("Aceptar"),
            onPressed: () => Get.back(),
          ),
        ),
      );
      // Alert Material
      // Get.dialog(
      //   AlertDialog(
      //     title: Text("Error"),
      //     content: Text("Ingrese un valor válido"),
      //   ),
      // );
    }
  }
}
