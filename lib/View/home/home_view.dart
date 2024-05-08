// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Controller/posts_controller.dart';
import 'package:posts/View/home/components/categories.dart';
import 'package:posts/View/home/components/post_view.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  PostsController controller = Get.put(
    PostsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.isTrue
          ? Center(
              child: CircularProgressIndicator(
                color: Color(
                  0xFF0D2444,
                ),
              ),
            )
          : Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: controller.pageController,
                  itemCount: controller.posts.length,
                  onPageChanged: (int page) {
                    controller.activePage(page);
                    controller.activeImage(0);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return PostView(
                      post: controller.posts[index],
                    );
                  },
                ),
                Positioned(
                  top: 50,
                  child: PostCategories(),
                ),
              ],
            ),
    );
  }
}
