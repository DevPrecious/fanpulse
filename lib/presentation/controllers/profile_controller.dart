import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString userName = 'John Doe'.obs;
  final RxString favoriteClub = 'Arsenal'.obs;
  final RxInt totalPoints = 2450.obs;
  final RxString fanRank = 'Captain'.obs;
  final RxList<String> badges = <String>['🎯', '⚽', '🔥'].obs;
  
  void updateUserName(String name) {
    userName.value = name;
  }
  
  void updateFavoriteClub(String club) {
    favoriteClub.value = club;
  }
}

