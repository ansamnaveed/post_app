import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/Controller/bottom_bar_controller.dart';

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
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Obx(
          () => BottomNavigationBar(
            onTap: (int index) {
              controller.selectTab(index);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0xFF0D2444),
            selectedLabelStyle: TextStyle(
              color: Color(
                0xFF3CFEDE,
              ),
            ),
            currentIndex: controller.currentIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(
                    "assets/icons/home.png",
                  ),
                  width: 20,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(
                    "assets/icons/home.png",
                  ),
                  width: 20,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                        ),
                        iconSize: 40,
                      )
                      // Icon(
                      //   Icons.add,
                      // ),
                      ),
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                ),
                label: 'Favorites',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
