import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../model/product_model.dart';
import '../../../data/product_data.dart';

class ProductDetailsProvider extends ChangeNotifier {
  final productData = Get.find<ProductDataUser>();

  List<ProductModel> _productsListCatWise = [];
  List<ProductModel> get productsListCatWise => _productsListCatWise;

  getProductCatWise(String cat) {
    _productsListCatWise = productData.products
        .where((element) => element.productCategory == cat)
        .toList();
 
  }
}
