import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Controller/posts_controller.dart';
import 'package:posts/View/nav_bar.dart';
import 'package:posts/utils/constants/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(PostsController()).getPosts();
    Timer(
      Duration(seconds: 3),
      () {
        Get.to(
          () => NavBarView(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3CFEDE),
              Color(0xFF3263B0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            StringConstant.app_name,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
