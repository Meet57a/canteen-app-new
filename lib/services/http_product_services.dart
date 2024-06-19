import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/product_model.dart';
import 'routes.dart';

class HttpProductsServices {
  Future<Response> addPorducts(ProductModel model, String token) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.addProductRoute),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProducts() async {
    try {
      var response = await http.get(
        Uri.parse(Routes.getProductRoute),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
