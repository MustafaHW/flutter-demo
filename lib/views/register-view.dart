import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/constants/routes.dart';
import 'package:flutter_application_2/custom-widgets/custom-form-field.dart';
import 'package:flutter_application_2/services/api-service.dart';
import 'package:flutter_application_2/services/auth-service.dart';
import 'package:flutter_application_2/services/template-service.dart';
import 'dart:developer' as dev show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  final signUpFormKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();
  final AuthService authService = AuthService();
  final TemplateService templateService = TemplateService();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void registerUser() async {
    authService.register(
        email: _emailController.text,
        password: _passwordController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: signUpFormKey,
        child: Column(children: [
          CustomFormField(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          CustomFormField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          CustomFormField(
            controller: _firstNameController,
            hintText: 'First Name',
            keyboardType: TextInputType.text,
          ),
          CustomFormField(
            controller: _lastNameController,
            hintText: 'Last Name',
            keyboardType: TextInputType.text,
          ),
          // CustomFormField(
          //   controller: _emailController,
          //   hintText: 'Gender',
          //   keyboardType: TextInputType.text,
          // ),
          //enum selector to be build
          // CustomFormField(
          //   controller: _emailController,
          //   hintText: 'Birthday',
          //   keyboardType: TextInputType.datetime,
          // ),
          //just date keyboard
          TextButton(
            onPressed: () async {
              if (signUpFormKey.currentState!.validate()) {
                registerUser();
                // if (response != null) {
                //   if (mounted) {
                //     Navigator.of(context).pushNamedAndRemoveUntil(
                //         Routes().posts, (route) => false);
                //   }
                // }
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
              onPressed: () async {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes().login, (route) => false);
              },
              child: const Text('Already Registered?'))
        ]),
      ),
    );
  }
}
