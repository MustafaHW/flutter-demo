import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/enums/enums.dart' show MenuActions;
import 'package:flutter_application_2/models/posts.dart' show PostModel;
import 'package:flutter_application_2/services/auth-service.dart';
import 'package:flutter_application_2/services/posts-service.dart';
import 'dart:developer' as dev show log;

import 'package:flutter_application_2/services/template-service.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  var authService = AuthService();
  var templateService = TemplateService();
  var postsService = PostsService();
  var posts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              switch (value) {
                case MenuActions.logout:
                  final isLogout =
                      await templateService.dialog(context, 'Logout');
                  dev.log(isLogout.toString());
                  if (isLogout) {
                    await authService.logout();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login/', (_) => false);
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuActions>(
                    value: MenuActions.logout, child: Text('Logout')),
              ];
            },
          )
        ],
      ), //Header
      body: (FutureBuilder<List<PostModel>>(
        future: postsService.findAll(context),
        builder:
            ((BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
          // switch (snapshot.connectionState) {
          // case ConnectionState.done:
          if (snapshot.hasData) {
            posts = [];
            posts = snapshot.data as List<PostModel>;

            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                      posts[index].title,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }));
          } else {
            return const CircularProgressIndicator();
          }
          // default:
          //   return const CircularProgressIndicator();
          // }
        }),
      )),
    );
  }
}
