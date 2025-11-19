import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedBottomNavIndex = 0.obs;
  
  void updateBottomNavIndex(int index) {
    selectedBottomNavIndex.value = index;
  }
}

