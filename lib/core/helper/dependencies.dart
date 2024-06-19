import 'package:canteen/core/data/user_data_provider.dart';
import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/features/auth/controller/auth_controller.dart';
import 'package:canteen/services/http_product_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_data_model.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => UserDataProvider());
  Get.lazyPut(() => ProductDataAdmin());

  // model
  Get.lazyPut(
    () => UserDataModel(
      token: sharedPreferences.getString("token") ?? '',
      fullName: sharedPreferences.getString("fullName") ?? '',
      eMail: sharedPreferences.getString("eMail") ?? '',
      mobileNo: sharedPreferences.getString("mobileNo") ?? '',
      role: sharedPreferences.getString("role") ?? '',
      userId: sharedPreferences.getString("userId") ?? '',
      isLoggedIn: sharedPreferences.getBool("isLoggedIn") ?? false,
    ),
  );

  //controller

  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ProductControllerAdmin());

  //Services
  Get.lazyPut(() => HttpProductsServices());
}
