// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  String videoUrl;
  VideoApp({
    super.key,
    required this.videoUrl,
  });

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.videoUrl,
      ),
    )..initialize().then(
        (_) {
          setState(
            () {
              _controller.play();
            },
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: VideoPlayer(_controller),
            )
          : Container(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
