import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/helpers/helpers.dart';
import 'package:flutter_application_2/services/template-service.dart';
import 'package:http/http.dart' as http;

final TemplateService templateService = TemplateService();
final Helpers helper = Helpers();

void handleError(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  print(response);
  if (response.statusCode == 200 || response.statusCode == 201) {
    onSuccess();
  } else if (response.statusCode >= 400 && response.statusCode <= 500) {
    var message = jsonDecode(response.body)["message"];
    if (message is List) {
      message = helper.listToString(message);
    }
    templateService.showSnackBar(context, message);
  } else {
    templateService.showSnackBar(context, response.body);
  }
}
