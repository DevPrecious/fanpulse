import 'package:get/get.dart';

class LiveMatchController extends GetxController {
  final RxString selectedManOfTheMatch = ''.obs;
  final RxString selectedNextEvent = ''.obs;
  final RxMap<String, int> reactions = <String, int>{}.obs;
  
  void selectManOfTheMatch(String playerId) {
    selectedManOfTheMatch.value = playerId;
  }
  
  void selectNextEvent(String event) {
    selectedNextEvent.value = event;
  }
  
  void addReaction(String emoji) {
    if (reactions.containsKey(emoji)) {
      reactions[emoji] = reactions[emoji]! + 1;
    } else {
      reactions[emoji] = 1;
    }
  }
}

