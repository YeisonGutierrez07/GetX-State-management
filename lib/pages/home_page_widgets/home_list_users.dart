import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_state_management/controllers/home_controller.dart';
import 'package:getx_state_management/models/user.dart';

class HomeListUsers extends StatelessWidget {
  const HomeListUsers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loadingService) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
          );
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final UserModel user = _.listUsers[index];
            return ListTile(
              onTap: () => _.showUserProfile(user),
              title: Text(user.firstName),
              subtitle: Text(user.lastName),
            );
          },
          itemCount: _.listUsers.length,
        );
      },
    );
  }
}
