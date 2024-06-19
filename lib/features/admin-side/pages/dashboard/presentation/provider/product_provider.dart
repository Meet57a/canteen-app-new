import 'dart:async';
import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductProvider extends ChangeNotifier {
  final productController = Get.find<ProductControllerAdmin>();
  final _productData = Get.find<ProductDataAdmin>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ProductDataAdmin get productData => _productData;

  setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  getProduct() async {
    await productController.getProduct();
    _productData.setCategorys();
    _productData.setPrioritys();
    _productData.setSubCategorys();
    _productData.setMenu();
  }

  setState() {
    notifyListeners();
  }

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    await productController.getProduct();
  }
}
