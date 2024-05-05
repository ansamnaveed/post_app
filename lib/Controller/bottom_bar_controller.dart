import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  selectTab(int index) {
    currentIndex.value = index;
    update();
  }
}
