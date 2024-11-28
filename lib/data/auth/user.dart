import 'package:myclinic/models/user_model.dart';

class User {
  static UserModel? _user;
  void setUser(UserModel user) {
    _user = user;
  }

  UserModel? getUser() {
    return _user;
  }
}
