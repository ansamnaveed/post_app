import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Controller/bottom_bar_controller.dart';
import 'package:posts/View/coming_soon.dart';
import 'package:posts/View/home/home_view.dart';
import 'package:posts/utils/constants/app_images.dart';
import 'package:posts/utils/constants/app_strings.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  BottomNavigationBarController controller = Get.put(
    BottomNavigationBarController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => bottomItems[controller.currentIndex.value]["screen"],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Color(
          0xFF0D2444,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomItems.length,
            (index) => GestureDetector(
              onTap: () {
                if (index != 2) {
                  controller.selectTab(index);
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        bottomItems[index]["icon"],
                      ),
                      width: index == 2 ? 60 : 24,
                      color: controller.currentIndex.value == index
                          ? Color(0xFF3CFEDE)
                          : index == 2
                              ? null
                              : Color(0xFFA0ACBD),
                    ),
                    bottomItems[index]["label"] == ""
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Text(
                              bottomItems[index]["label"],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: controller.currentIndex.value == index
                                    ? Color(0xFF3CFEDE)
                                    : Color(
                                        0xFFA0ACBD,
                                      ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List bottomItems = [
    {
      "icon": ImageConstant.home_icon,
      "label": StringConstant.home,
      "screen": HomeView(),
    },
    {
      "icon": ImageConstant.search_icon,
      "label": StringConstant.discover,
      "screen": ComingSoonWidget(),
    },
    {
      "icon": ImageConstant.add_icon,
      "label": "",
      "screen": ComingSoonWidget(),
    },
    {
      "icon": ImageConstant.deals_icon,
      "label": StringConstant.deals,
      "screen": ComingSoonWidget(),
    },
    {
      "icon": ImageConstant.profile_icon,
      "label": StringConstant.profile,
      "screen": ComingSoonWidget(),
    },
  ];
}
