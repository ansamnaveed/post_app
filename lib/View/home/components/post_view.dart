import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Controller/posts_controller.dart';
import 'package:posts/Model/post_model.dart';
import 'package:posts/View/home/components/video_player.dart';
import 'package:posts/utils/common_widgets/circle_btn.dart';
import 'package:posts/utils/common_widgets/gradient_btn.dart';
import 'package:posts/utils/constants/app_images.dart';
import 'package:posts/utils/constants/app_strings.dart';
import 'package:posts/utils/constants/app_url.dart';

// ignore: must_be_immutable
class PostView extends StatelessWidget {
  Post post;
  PostView({
    super.key,
    required this.post,
  });

  PostsController controller = Get.put(
    PostsController(),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Stack(
        children: [
          post.postVideo == ""
              ? PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: controller.imagesController,
                  itemCount: post.images!.length,
                  onPageChanged: (int page) {
                    controller.activeImage(page);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Image(
                      image: NetworkImage(
                        ApiConstant.images_url +
                            post.images![index].image.toString(),
                      ),
                      errorBuilder: (context, error, stackTrace) {
                        return Image(
                          image: AssetImage(
                            ImageConstant.default_image,
                          ),
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  },
                )
              : VideoApp(
                  videoUrl: post.postVideo.toString(),
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        post.postTitle.toString() == ""
                            ? SizedBox()
                            : Text(
                                post.postTitle.toString().capitalize!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                        post.price == 0
                            ? SizedBox()
                            : Text(
                                StringConstant.currency + post.price.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFF6A826),
                                ),
                              ),
                        post.description.toString() == ""
                            ? SizedBox()
                            : Text(
                                post.description.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                        post.hashtagTitles.toString() == ""
                            ? SizedBox()
                            : Text(
                                post.hashtagTitles.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                        post.country.toString() == ""
                            ? SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        ImageConstant.flag_image,
                                      ),
                                      radius: 12,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      post.country.toString(),
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        GradientButton(
                          text: StringConstant.visit_website,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        post.postVideo.toString() != ""
                            ? SizedBox()
                            : Row(
                                children: List.generate(
                                  post.images!.length,
                                  (index) => Obx(
                                    () => AnimatedContainer(
                                      duration: Duration(
                                        milliseconds: 300,
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                      width:
                                          controller.activeImage.value == index
                                              ? 20
                                              : 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        gradient:
                                            controller.activeImage.value ==
                                                    index
                                                ? LinearGradient(
                                                    colors: [
                                                      Color(
                                                        0xFFF7631D,
                                                      ),
                                                      Color(
                                                        0xFFF9B527,
                                                      ),
                                                    ],
                                                  )
                                                : null,
                                        color: controller.activeImage.value ==
                                                index
                                            ? Colors.yellow
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        CircleBtn(
                          imagePath: ImageConstant.offer_icon,
                          labelText: StringConstant.offer,
                        ),
                        CircleBtn(
                          imagePath: ImageConstant.like_icon,
                          labelText: post.likes.toString(),
                        ),
                        CircleBtn(
                          imagePath: ImageConstant.comment_icon,
                          labelText: post.comments.toString(),
                        ),
                        CircleBtn(
                          imagePath: ImageConstant.share_icon,
                          labelText: post.shares.toString(),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            post.profileImage.toString(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
