import 'package:get/get.dart';

class LeaderboardController extends GetxController {
  final RxString selectedLeaderboardType = 'global'.obs;
  
  void changeLeaderboardType(String type) {
    selectedLeaderboardType.value = type;
  }
}

