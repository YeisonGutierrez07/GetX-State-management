import 'package:dio/dio.dart';
import 'package:getx_state_management/models/user.dart';

class UsersAPI {
  UsersAPI._internal();

  static UsersAPI _instance = UsersAPI._internal();
  static UsersAPI get instance => _instance;

  final _dio = Dio();

  Future<List<UserModel>> getUsers(int page) async {
    try {
      final Response response = await this._dio.get(
        "https://reqres.in/api/users",
        queryParameters: {"page": page, "delay": 5},
      );

      return (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } catch (e) {
      return null;
    }
  }
}
