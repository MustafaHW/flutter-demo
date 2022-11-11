import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev show log;

class AuthService {
  var user;
  setUser(user) async {
    final storage = await SharedPreferences.getInstance();
    final storageUser = await storage.setString('user', user);
    return storageUser;
  }

  Future<Object?> getUser() async {
    final storage = await SharedPreferences.getInstance();
    user = storage.containsKey('user') ? storage.getString('user') : null;
    return user.isNotEmpty ? (jsonDecode(user)) : {};
  }

  Future<bool> isAuthenticated() async {
    final storage = await SharedPreferences.getInstance();
    user = storage.containsKey('user') ? storage.getString('user') : null;
    dev.log(user.isEmpty.toString());
    if (user.isEmpty == true) {
      return false;
    } else {
      if (jsonDecode(user)['token'].toString().isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    // return (user.isEmpty ? false : jsonDecode(user)['token']) ? true : false;
  }

  logout() async {
    final storage = await SharedPreferences.getInstance();
    return await storage.remove('user');
  }
}
