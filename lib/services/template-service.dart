import 'package:flutter/material.dart';
import 'package:flutter_application_2/helpers/helpers.dart';
import 'package:flutter_application_2/services/auth-service.dart';
import 'dart:developer' as dev show log;

class TemplateService {
  final Helpers helper = Helpers();

  Future<bool> dialog(BuildContext context, String mode) {
    var authService = AuthService();
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(mode.toString().toUpperCase()),
            content:
                Text('Do you really want to ${mode.toString().toLowerCase()}?'),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(mode.toString().toUpperCase())),
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Cancel'.toUpperCase())),
            ],
          );
        }).then((value) => value ?? false);
  }

  Future<bool> errorDialog(BuildContext context, dynamic error) async {
    print(error.toString());
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'.toUpperCase()),
            content:
                Text((error is List) ? helper.listToString(error) : error.toString()),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Ok'.toUpperCase())),
            ],
          );
        }).then((value) => value ?? false);
  }

  showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
      // action: SnackBarAction(label: 'testtt', onPressed: () {}),
    ));
  }
}
