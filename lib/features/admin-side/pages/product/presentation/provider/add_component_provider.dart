import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class AddAndEditComponentProvider extends ChangeNotifier {
  Uint8List? _image;
  String _base64Image = '';
  String _mimeType = '';
  final _couponNameOrIdController = TextEditingController();
  final _couponPriceController = TextEditingController();


  Uint8List? get image => _image;
  String get base64Image => _base64Image;
  String get mimeType => _mimeType;
  TextEditingController get couponNameOrIdController => _couponNameOrIdController;
  TextEditingController get couponPriceController => _couponPriceController;


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
}
