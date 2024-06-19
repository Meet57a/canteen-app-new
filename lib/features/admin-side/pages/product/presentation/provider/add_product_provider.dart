import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../../../../model/product_model.dart';
import '../../../../../../model/response_model.dart';

class AddProductProvider extends ChangeNotifier {
  final _productData = Get.find<ProductDataAdmin>();
  final productControllerAdmin = Get.find<ProductControllerAdmin>();
  final _productName = TextEditingController();
  final _productDescription = TextEditingController();
  final _productPrice = TextEditingController();
  final _productQuantity = TextEditingController();
  final _selectedCategory = TextEditingController();
  final _selectedSubCategory = TextEditingController();
  final _selectedPriority = TextEditingController();
  final _stockController = TextEditingController();
  final _menuName = TextEditingController();
  final _discountPercentage = TextEditingController();
  final _addProductKey = GlobalKey<FormState>();

  Uint8List? _image;
  String _base64Image = "";
  String _mimeType = "";
  bool _isWriteCategory = false;
  bool _isWriteSubCategory = false;
  bool _isWritePriorityOfFood = false;
  bool _isAvailableStatusActive = true;
  bool _isDiscountActive = false;
  bool _isLoading = false;
  bool _isWriteMenu = false;

  ProductDataAdmin get productData => _productData;
  TextEditingController get productName => _productName;
  TextEditingController get productDescription => _productDescription;
  TextEditingController get productPrice => _productPrice;
  TextEditingController get productQuantity => _productQuantity;
  TextEditingController get selectedCategory => _selectedCategory;
  TextEditingController get selectedSubCategory => _selectedSubCategory;
  TextEditingController get selectedPriority => _selectedPriority;
  TextEditingController get stockController => _stockController;
  TextEditingController get menuName => _menuName;
  TextEditingController get discountPercentage => _discountPercentage;
  GlobalKey<FormState> get addProductKey => _addProductKey;
  Uint8List? get image => _image;
  String get base64Image => _base64Image;
  String get mimeType => _mimeType;

  bool get isWriteCategory => _isWriteCategory;
  bool get isWriteSubCategory => _isWriteSubCategory;
  bool get isWritePriorityOfFood => _isWritePriorityOfFood;
  bool get isAvailableStatusActive => _isAvailableStatusActive;
  bool get isDiscountActive => _isDiscountActive;
  bool get isWriteMenu => _isWriteMenu;

  bool get isLoading => _isLoading;

  void setWritingState(bool isWrite, String writeField) {
    if (writeField == "Category") {
      _isWriteCategory = isWrite;
    } else if (writeField == "SubCategory") {
      _isWriteSubCategory = isWrite;
    } else if (writeField == "Priority") {
      _isWritePriorityOfFood = isWrite;
    } else if (writeField == "menu") {
      _isWriteMenu = isWrite;
    }
    notifyListeners();
  }

  void setStatus(bool isActive, String statusName) {
    if (statusName == "Available") {
      _isAvailableStatusActive = isActive;
    } else if (statusName == "Discount") {
      _isDiscountActive = isActive;
    }
    notifyListeners();
  }

  void pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _mimeType = lookupMimeType(pickedImage.path) ?? '';
      final imageBytes = await pickedImage.readAsBytes();
      _image = await pickedImage.readAsBytes();
      _base64Image = base64Encode(imageBytes);
      notifyListeners();
    }
  }

  void setLoading() {
    _isLoading = !_isLoading;

    notifyListeners();
  }

  Future<ResponseModel> addProductProviderFunc() {
    setLoading();

    ProductModel model = ProductModel(
      productName: _productName.text.trim(),
      productPrice: _productPrice.text.trim(),
      productQuantity: _productQuantity.text.trim(),
      productCategory: _selectedCategory.text.trim(),
      subCategory: _selectedSubCategory.text.trim(),
      priorityOfFood: _selectedPriority.text.trim(),
      productDescription: _productDescription.text.trim(),
      productImage: _image,
      mimeType: _mimeType,
      productStock: _stockController.text.trim(),
      productMenu: _menuName.text.trim(),
      statusAvailable: _isAvailableStatusActive.toString(),
      discountActive: _isDiscountActive.toString(),
      discountPercentage: _discountPercentage.text.trim(),
    );

    var res = productControllerAdmin.addProductController(model);
    clearProvider();

    return res;
  }

  void clearProvider() {
    _productName.clear();
    _productDescription.clear();
    _productPrice.clear();
    _productQuantity.clear();
    _selectedCategory.clear();
    _selectedSubCategory.clear();
    _selectedPriority.clear();
    _stockController.clear();
    _discountPercentage.clear();
    _image = null;
    _base64Image = "";
    _mimeType = "";
    _isWriteCategory = false;
    _isWriteSubCategory = false;
    _isWritePriorityOfFood = false;
    _isAvailableStatusActive = true;
    _isDiscountActive = false;
    notifyListeners();
  }
}