import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../../../../model/category_model.dart';
import '../../../../../../model/response_model.dart';
import '../../../../controller/product_controller.dart';

class AddAndEditComponentProvider extends ChangeNotifier {
  final productController = Get.find<ProductControllerAdmin>();

  Uint8List? _image;
  String _base64Image = '';
  String _mimeType = '';
  final _couponNameOrIdController = TextEditingController();
  final _couponPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;



  //categorys
  final _categoryName = TextEditingController();
  final _subCategoryName = TextEditingController();

  TextEditingController get categoryName => _categoryName;
  TextEditingController get subCategoryName => _subCategoryName;

  Uint8List? get image => _image;
  String get base64Image => _base64Image;
  String get mimeType => _mimeType;
  TextEditingController get couponNameOrIdController =>
      _couponNameOrIdController;
  TextEditingController get couponPriceController => _couponPriceController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading() {
    _isLoading = !_isLoading;
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

  Future<ResponseModel> addCate() async {
    setLoading();
    CategoryModel model = CategoryModel(
      id: "",
      subCategory: subCategoryName.text.trim(),
      categoryNameMain: categoryName.text.trim(),
      image: "",
      imageUnit: image,
      mimeType: mimeType,
    );
    ResponseModel res = await productController.addCategoryController(model);
    setLoading();
    return res;
  }

  Future<ResponseModel> addSubCate() async {
    setLoading();
    CategoryModel model = CategoryModel(
      id: "",
      subCategory: subCategoryName.text.trim(),
      categoryNameMain: categoryName.text.trim(),
      image: "",
      imageUnit: image,
      mimeType: mimeType,
    );
    ResponseModel res = await productController.addSubCategoryController(model);
    setLoading();
    return res;
  }
}
