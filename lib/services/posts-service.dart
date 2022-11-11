import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_application_2/models/posts.dart';
import 'dart:developer' as dev show log;
import 'api-service.dart';

class PostsService {
  Future<List<PostModel>> findAll(BuildContext context) async {
    final String posts = await ApiService().get('posts', context);
    print('posts');
    // print(jsonDecode(posts).toString());
    // return PostModel.fromJSON(jsonDecode(posts)) as List;
    return List<PostModel>.from(jsonDecode(posts).map((x) => PostModel.fromJSON(x)));
  }

  Future<Object> findOne(int id, BuildContext context) async {
    return ApiService().get('posts', context, params: id.toString());
  }

  create(createPostDto, BuildContext context) async {
    return ApiService().post('', createPostDto, context);
  }

  update(int id, updatePostDto, BuildContext context) async {
    return ApiService().post('', updatePostDto, context);
  }

  delete(int id, BuildContext context) async {
    return ApiService().delete('', id);
  }
}
