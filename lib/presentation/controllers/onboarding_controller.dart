import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final RxInt currentPage = 0.obs;
  
  void updatePage(int page) {
    currentPage.value = page;
  }
  
  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
    }
  }
  
  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }
  
  bool isLastPage() {
    return currentPage.value == 2;
  }
}

