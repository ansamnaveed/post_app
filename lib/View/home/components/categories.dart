import 'package:flutter/material.dart';
import 'package:posts/utils/constants/app_images.dart';
import 'package:posts/utils/constants/app_strings.dart';

class PostCategories extends StatelessWidget {
  PostCategories({super.key});

  List categories = [
    {
      "label": StringConstant.add_listing,
      "image": ImageConstant.plus_icon,
    },
    {
      "label": StringConstant.search,
      "image": ImageConstant.search_icon1,
    },
    {
      "label": StringConstant.notification,
      "image": ImageConstant.notification_icon,
    },
    {
      "label": StringConstant.electronics,
      "image": ImageConstant.electronics_image,
    },
    {
      "label": StringConstant.appliances,
      "image": ImageConstant.appliances_image,
    },
    {
      "label": StringConstant.electronics,
      "image": ImageConstant.electronics_image,
    },
    {
      "label": StringConstant.mobiles,
      "image": ImageConstant.appliances_image,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Container(
            width: 60,
            margin: EdgeInsets.only(
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Stack(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                            "assets/images/border.png",
                          ),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Center(
                        child: Image(
                          image: AssetImage(
                            categories[index]["image"],
                          ),
                          width: categories[index]["image"]
                                      .toString()
                                      .contains("icons") ==
                                  true
                              ? 24
                              : 42,
                          height: categories[index]["image"]
                                      .toString()
                                      .contains("icons") ==
                                  true
                              ? 24
                              : 42,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categories[index]["label"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
