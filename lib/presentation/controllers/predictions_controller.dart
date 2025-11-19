import 'package:get/get.dart';

class PredictionsController extends GetxController {
  final RxMap<String, Map<String, dynamic>> predictions = <String, Map<String, dynamic>>{}.obs;
  final RxString selectedTab = 'upcoming'.obs;
  
  void makePrediction(String matchId, String prediction, {int? homeScore, int? awayScore}) {
    predictions[matchId] = {
      'prediction': prediction,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'timestamp': DateTime.now(),
    };
  }
  
  void changeTab(String tab) {
    selectedTab.value = tab;
  }
  
  bool hasPredicted(String matchId) {
    return predictions.containsKey(matchId);
  }
}

