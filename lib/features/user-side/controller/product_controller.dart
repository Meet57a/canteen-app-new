import 'dart:convert';

import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart';

import '../../../model/product_model.dart';
import '../../../services/http_product_services.dart';

class ProductControllerUser {
  getProducts() async {
    try {
      final service = Get.find<HttpProductsServices>();
      final productData = Get.find<ProductDataUser>();

      Response response = await service.getProducts();

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final List<dynamic> jsonData = data['data'];

        List<ProductModel> products = jsonData.map((e) {
          return ProductModel.fromJson(e);
        }).toList();

        productData.setProducts(products);
        productData.setCategorys();
        productData.setPrioritys();
        productData.setSubCategorys();
        productData.setMenu();
      }
    } catch (e) {
      rethrow;
    }
  }
}
