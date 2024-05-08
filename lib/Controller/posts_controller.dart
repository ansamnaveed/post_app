import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Model/post_model.dart';
import 'package:posts/utils/constants/app_url.dart';

class PostsController extends GetxController {
  final PageController pageController = PageController();
  final PageController imagesController = PageController();
  RxInt activePage = 0.obs;
  RxInt activeImage = 0.obs;

  RxList<Post> posts = <Post>[].obs;

  RxBool loading = false.obs;

  getPosts() {
    loading(true);
    Dio()
        .post(
      ApiConstant.get_posts,
    )
        .then(
      (response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          loading(false);
          for (var i = 0; i < response.data["posts"].length; i++) {
            posts.add(
              Post.fromJson(
                response.data["posts"][i],
              ),
            );
          }
        }
      },
    );
  }
}
