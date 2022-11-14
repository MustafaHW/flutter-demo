import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/helpers/errors-handling.dart';
import 'package:flutter_application_2/services/template-service.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev show log;

import 'package:http/http.dart';

class UnknownClientException implements Exception {}

class ApiService {
  // final String apiUrl = dotenv.get('API_URL', fallback: 'localhost:3000');
  // final String env = dotenv.get('ENV', fallback: 'development');
  final env = 'development';
  final String apiUrl = '10.200.200.68:3000';
  final TemplateService templateService = TemplateService();
  final headers = {"content-type": "application/json; charset=utf-8"};

  Future get(String path, BuildContext context, {String? params}) async {
    try {
      if (params != null) {
        path = path + params;
      }
      dev.log(env.toString());
      final Uri url = env == 'production'
          ? Uri.https(apiUrl, path)
          : Uri.http(apiUrl, path);
      final http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } on ClientException {
      throw UnknownClientException();
    } catch (e) {
      // if (e.toString() == '')
      dev.log('get req: ${e.toString()}');
      templateService.errorDialog(context, e.toString());
    }
  }

  Future<dynamic> post(String path, body, BuildContext context) async {
    try {
      final url = env == 'production'
          ? Uri.https(apiUrl, path)
          : Uri.http(apiUrl, path);
      final dynamic response =
          await http.post(url, body: body, headers: headers);
      return response;
    } catch (e) {
      dev.log('post req: ${e.toString()}');
      templateService.showSnackBar(context, e.toString());
      // templateService.errorDialog(context, e.toString());
    }
  }

  Future delete(String path, int id, BuildContext context) async {
    final idPath = path.toString() + id.toString();
    try {
      final url = env == 'production'
          ? Uri.https(apiUrl, path)
          : Uri.http(apiUrl, path);
      final dynamic response = await http.delete(url, headers: headers);
      return response;
    } catch (e) {
      dev.log('Delete req: ${e.toString()}');
      // templateService.errorDialog(context, e.toString());
    }
  }
}
