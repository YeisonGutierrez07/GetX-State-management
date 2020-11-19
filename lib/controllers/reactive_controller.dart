import 'package:get/get.dart';
import 'package:getx_state_management/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString date = ''.obs;

  RxList<String> listDates = List<String>().obs;
  RxMap<String, String> mapNumbers = Map<String, String>().obs;
  PetModel myPet = PetModel(name: "Lilo", age: 3);

  void increment() {
    counter.value++;
  }

  void setDate() {
    date.value = DateTime.now().toString();
  }

  void addItem() {
    listDates.add(DateTime.now().toString());
  }

  void deleteItem(int index) {
    listDates.removeAt(index);
  }

  void addNumberItem() {
    String position = mapNumbers.length.toString();
    print(position);
    mapNumbers[DateTime.now().toString()] = DateTime.now().toString();
  }

  void deleteNumberItem(String number) {
    mapNumbers.removeWhere((key, value) => value == number);
  }

  void addAgeMyPet(int newAge) {
    myPet.age = newAge;
  }
}
