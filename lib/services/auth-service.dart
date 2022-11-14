import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/helpers/errors-handling.dart';
import 'package:flutter_application_2/models/user.dart';
import 'package:flutter_application_2/providers/user-provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api-service.dart';
import 'package:flutter_application_2/constants/routes.dart';

class AuthService {
  final ApiService apiService = ApiService();
  var user;

  Future<User?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final body = User(email: email, password: password);
    final response =
        await apiService.post('users/login', body.toJson(), context);
    if (response != null) {
      // final User userResponse = User.fromJson((response));
      handleError(
        response: response,
        context: context,
        onSuccess: () async {
          print('tes');
          templateService.showSnackBar(context, 'Logged in');
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          await setUser(response.body);
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes().posts,
            (route) => false,
          );
        },
      );
      // return userResponse;
    }
  }

  Future<User?> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      String? gender,
      String? birthday,
      required BuildContext context}) async {
    final body = User(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName);
    final response =
        await apiService.post('users/register', body.toJson(), context);
    if (response != null) {
      // final User userResponse = User.fromJson((response));
      handleError(
        response: response,
        context: context,
        onSuccess: () async {
          templateService.showSnackBar(context, 'Registered');
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          await setUser(response.body);
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes().posts,
            (route) => false,
          );
        },
      );
      // return userResponse;
    }
  }

  setUser(user) async {
    final storage = await SharedPreferences.getInstance();
    final storageUser = await storage.setString('user', user.toString());
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
