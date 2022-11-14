import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    birthday: '',
    email: '',
    firstName: '',
    gender: '',
    lastName: '',
    password: '',
    token: '',
  );
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
