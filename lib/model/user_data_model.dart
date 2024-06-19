class UserDataModel {
  String fullName;
  String eMail;
  String mobileNo;
  String role;
  String token;
  String userId;
  bool? isLoggedIn;

  UserDataModel({
    required this.fullName,
    required this.eMail,
    required this.mobileNo,
    required this.role,
    required this.token,
    required this.userId,
    this.isLoggedIn,
  });



}
