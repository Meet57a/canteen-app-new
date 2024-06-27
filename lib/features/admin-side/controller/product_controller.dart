import 'dart:convert';

import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/product_model.dart';
import 'package:canteen/services/http_product_services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/response_model.dart';

class ProductControllerAdmin {
  final service = Get.find<HttpProductsServices>();
  final productData = Get.find<ProductDataAdmin>();

  Future<ResponseModel> addProductController(ProductModel model) async {
    final prefs = await SharedPreferences.getInstance();
    Response response =
        await service.addPorducts(model, prefs.getString('token') ?? "");

    var responseDecode = jsonDecode(response.body);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel.fromJson(responseDecode);
    } else {
      responseModel = ResponseModel.fromJson(responseDecode);
    }

    return responseModel;
  }

  Future<ResponseModel> addCategoryController(CategoryModel model) async {
    final prefs = await SharedPreferences.getInstance();
    Response response =
        await service.addCategory(model, prefs.getString('token') ?? "");

    var responseDecode = jsonDecode(response.body);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel.fromJson(responseDecode);
    } else {
      responseModel = ResponseModel.fromJson(responseDecode);
    }

    return responseModel;
  }

  Future<ResponseModel> addSubCategoryController(CategoryModel model) async {
    final prefs = await SharedPreferences.getInstance();
    Response response =
        await service.addSubCategory(model, prefs.getString('token') ?? "");

    var responseDecode = jsonDecode(response.body);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel.fromJson(responseDecode);
    } else {
      responseModel = ResponseModel.fromJson(responseDecode);
    }

    return responseModel;
  }

  getAll() async {
    try {
      Response response = await service.getProducts();

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final jsonData = data['data'];

        final List<dynamic> productDataJson = jsonData['products'];
        final List<dynamic> categoryDataJson = jsonData['category'];
        final List<dynamic> subCategoryDataJson = jsonData['subCategory'];

        List<ProductModel> products = productDataJson.map((e) {
          return ProductModel.fromJson(e);
        }).toList();

        List<CategoryModel> category = categoryDataJson.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();
        print(category);
        List<CategoryModel> subCategory = subCategoryDataJson.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();
        print(category[0].categoryNameMain);
        productData.setProducts(products);
        productData.setCategorys(category);
        productData.setSubCategorys(subCategory);
        productData.setPrioritys();
        productData.setMenu();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> deleteProductController(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.deleteProduct(id, prefs.getString('token') ?? '');

      var responseDecode = jsonDecode(response.body);
      var responseModel = ResponseModel.fromJson(responseDecode);

      if (responseModel.status == true) {
        productData.products.removeWhere((element) => element.productId == id);
      }

      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> updateProductController(
      String id, ProductModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await service.updateProduct(
          id, prefs.getString('token') ?? "", model);

      var responseDecode = jsonDecode(response.body);
      var responseModel = ResponseModel.fromJson(responseDecode);

      return responseModel;
    } catch (e) {
      rethrow;
    }
  }
}
