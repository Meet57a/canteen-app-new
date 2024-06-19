import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/auth_model.dart';
import '../../admin-side/pages/dashboard/presentation/dashboard_page.dart';
import '../controller/auth_controller.dart';
import '../../../model/response_model.dart';
import '../../../model/user_data_model.dart';

class AuthProvider extends ChangeNotifier {
  final authController = Get.find<AuthController>();

  final _fullName = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _eMail = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _passWord = TextEditingController();
  bool _isPasswordVisible = true;
  final _registerFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController get fullName => _fullName;
  TextEditingController get mobileNumber => _mobileNumber;
  TextEditingController get eMail => _eMail;
  TextEditingController get confirmPassword => _confirmPassword;
  TextEditingController get passWord => _passWord;
  bool get isPasswordVisible => _isPasswordVisible;
  GlobalKey<FormState> get registerFormKey => _registerFormKey;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<ResponseModel> registerProvider() {
    AuthModel model = AuthModel(
      fullName: _fullName.text,
      mobileNumber: _mobileNumber.text,
      eMail: _eMail.text,
      passWord: _passWord.text,
      role: "isUser",
    );
    return authController.registerController(model);
  }

  Future<ResponseModel> loginProvider() {
    AuthModel model = AuthModel(
      eMail: _eMail.text,
      passWord: _passWord.text,
    );
    return authController.loginController(model);
  }

  naviGateTo(BuildContext context) {
    final user = Get.find<UserDataModel>();

    if (user.role == "isUser") {
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomePageUser()),
      //   (route) => false,
      // );
    } else if (user.role == "isVendor") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>  AdminDashboardPage()),
        (route) => false,
      );
    }
  }

  void clearTextFields() {
    _fullName.clear();
    _mobileNumber.clear();
    _eMail.clear();
    _confirmPassword.clear();
    _passWord.clear();
    notifyListeners();
  }
}
