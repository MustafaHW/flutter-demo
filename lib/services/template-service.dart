import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth-service.dart';
import 'dart:developer' as dev show log;

class TemplateService {
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

  Future<bool> errorDialog(BuildContext context, dynamic error) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'.toUpperCase()),
            content:
                Text((error is List) ? listToString(error) : error.toString()),
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

  listToString(List list) {
    var string='';
    dev.log('list to string ${list.toString()}');
    for (int i = 0; i < list.length; i++) {
      if(i>0){
        string += ', ';
      }
      var element = list[i];
      string += element.toString();
    }
    return string;
  }
}
