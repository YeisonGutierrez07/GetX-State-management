import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_state_management/models/product.dart';

class GlobalController extends GetxController {
  List<ProductModel> _productList = [];
  Map<String, ProductModel> _favorites = {};

  Map<String, ProductModel> get favorites => _favorites;
  List<ProductModel> get productList => _productList;

  @override
  void onInit() {
    super.onInit();
    print("Global on Init");
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString("assets/products.json");

    this._productList = (jsonDecode(productsString) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();

    update(['products']);
  }

  void changeFavorite(int index, bool isFavorite) {
    var product = this._productList[index];
    product.isFavorite = isFavorite;

    if (isFavorite) {
      this._favorites[product.name] = product;
    } else {
      this._favorites.remove(product.name);
    }

    update(['products', 'favorites']);
  }
}
