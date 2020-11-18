import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_state_management/api/users_api.dart';
import 'package:getx_state_management/models/user.dart';
import 'package:getx_state_management/pages/profile_page.dart';

class HomeController extends GetxController {
  int _count = 0;
  List<UserModel> _listUsers = [];
  bool _loadingService = true;

  int get count => _count;
  List<UserModel> get listUsers => _listUsers;
  bool get loadingService => _loadingService;

  @override
  void onReady() {
    super.onReady();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);

    this._listUsers = data;
    this._loadingService = false;

    update(['users']);
  }

  void increment() {
    this._count++;
    update(['text'], _count >= 10);
  }

  Future<void> showUserProfile(UserModel user) async {
    final result = await Get.to(ProfilePage(), arguments: user);

    if (result != null) {
      print("Result, $result");
    }
  }
}
