import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_state_management/controllers/global_controller.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
        itemBuilder: (__, index) {
          final product = _.productList[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("USD ${product.price}"),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: product.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                _.changeFavorite(index, !product.isFavorite);
              },
            ),
          );
        },
        itemCount: _.productList.length,
      ),
    );
  }
}
