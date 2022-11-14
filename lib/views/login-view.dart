import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/routes.dart';
import 'package:flutter_application_2/custom-widgets/custom-form-field.dart';
import 'package:flutter_application_2/models/user.dart';
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
  final loginFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final ApiService apiService = ApiService();
  final AuthService authService = AuthService();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    await authService.login(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: loginFormKey,
        child: Column(children: [
          CustomFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
          ),
          CustomFormField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          TextButton(
            onPressed: () async {
              if (loginFormKey.currentState!.validate()) {
                loginUser();
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () async {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes().register, (route) => false);
              },
              child: const Text('Register'))
        ]),
      ),
    );
  }
}
