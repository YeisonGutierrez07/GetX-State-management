import 'package:get/state_manager.dart';
import 'package:meta/meta.dart' show required;

class RxPetModel {
  final RxString name;
  final RxInt age;

  RxPetModel({
    @required this.name,
    @required this.age,
  });
}

class PetModel {
  RxPetModel rx;

  PetModel({
    @required String name,
    @required int age,
  }) {
    this.rx = RxPetModel(name: name.obs, age: age.obs);
  }

  String get name => this.rx.name.value;
  int get age => this.rx.age.value;

  set name(String value) {
    this.rx.name.value = value;
  }

  set age(int value) {
    this.rx.age.value = value;
  }
}
