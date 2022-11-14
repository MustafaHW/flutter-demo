// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFormField extends StatelessWidget {
  String? hintText;
  var controller;
  TextInputType? keyboardType;
  bool? obscureText = false;

 CustomFormField({
    Key? key,
    this.hintText,
    required this.controller,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      keyboardType: keyboardType,
      enableSuggestions: false,
      autocorrect: false,
      obscureText: obscureText ?? false,
      autofillHints: [AutofillHints.email],
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else {
          return null;
        }
      },
    );
  }
}
