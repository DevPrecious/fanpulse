import 'package:get/get.dart';

class PollsController extends GetxController {
  final RxMap<String, String> selectedPollOptions = <String, String>{}.obs;
  
  void selectPollOption(String pollId, String optionId) {
    selectedPollOptions[pollId] = optionId;
  }
  
  bool hasVotedForPoll(String pollId) {
    return selectedPollOptions.containsKey(pollId);
  }
}

