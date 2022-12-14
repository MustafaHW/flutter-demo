import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_application_2/models/posts.dart';
import 'dart:developer' as dev show log;
import 'api-service.dart';

class PostsService {
  final ApiService apiService = ApiService();

  Future<List<PostModel>> findAll(BuildContext context) async {
    final String posts = await apiService.get('posts', context);
    return List<PostModel>.from(
        jsonDecode(posts).map((x) => PostModel.fromJSON(x)));
  }

  Future<Object> findOne(int id, BuildContext context) async {
    return apiService.get('posts', context, params: id.toString());
  }

  create(createPostDto, BuildContext context) async {
    return apiService.post('', createPostDto, context);
  }

  update(int id, updatePostDto, BuildContext context) async {
    return apiService.post('', updatePostDto, context);
  }

  delete(int id, BuildContext context) async {
    return apiService.delete('', id, context);
  }
}
