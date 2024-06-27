import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/menu_model.dart';

import '../../../model/priority_model.dart';
import '../../../model/product_model.dart';

class ProductDataAdmin {
  List<MenuModel> _menus = [];
  List<MenuModel> get menus => _menus;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  List<CategoryModel> _categorys = [];
  List<CategoryModel> get categorys => _categorys;

  List<CategoryModel> _subCategorys = [];
  List<CategoryModel> get subCategorys => _subCategorys;

  List<PriorityModel> _prioritys = [];
  List<PriorityModel> get prioritys => _prioritys;

  setProducts(List<ProductModel> val) {
    _products = val;
  }

  setMenu() {
    var seen = Set<String>();

    List<ProductModel> menuWithProducts =
        _products.where((e) => seen.add(e.productMenu)).toList();
    _menus = menuWithProducts.map((e) {
      return MenuModel(name: e.productMenu);
    }).toList();
  }

  setCategorys(List<CategoryModel> val) {
    _categorys = val;
  }

  setSubCategorys(List<CategoryModel> val) {
    _subCategorys = val;
  }

  setPrioritys() {
    var seen = Set<String>();
    List<ProductModel> prioritysWithProducts =
        _products.where((e) => seen.add(e.priorityOfFood)).toList();
    _prioritys = prioritysWithProducts.map((e) {
      return PriorityModel(name: e.priorityOfFood);
    }).toList();
  }
}
