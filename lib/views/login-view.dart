import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/routes.dart';
import 'package:flutter_application_2/services/api-service.dart';
import 'package:flutter_application_2/services/auth-service.dart';
import 'dart:developer' as dev show log;

import 'package:flutter_application_2/services/template-service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var templateService = TemplateService();
  late final TextEditingController _email;
  late final TextEditingController _password;
  var apiService = ApiService();
  var authService = AuthService();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.amber,
      ),
      body: Column(children: [
        TextField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          // enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: _password,
          decoration: const InputDecoration(hintText: 'Password'),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            final response = await apiService
                .post('users/login', {"email": email, "password": password}, context);
            // try {
            if ((response.statusCode == 200 || response.statusCode == 201) &&
                response.toString().isNotEmpty) {
              final user = await authService.setUser(response.body);
              if (user != null) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes().posts, (route) => false);
              } else {
                dev.log('user null $user');
              }
            } else if (response.toString().isEmpty) {
              await templateService.errorDialog(
                  context, "Unknown error");
            } else {
              var response1 = jsonDecode(response.body);
              await templateService.errorDialog(context, response1["message"]);
            }
            // } catch (e) {
            //   dev.log('error: ${e.toString()}');
            //   await templateService.errorDialog(context, e);
            // }
          },
          child: const Text('Login'),
        ),
        TextButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes().register, (route) => false);
            },
            child: const Text('Register'))
      ]),
    );
  }
}
