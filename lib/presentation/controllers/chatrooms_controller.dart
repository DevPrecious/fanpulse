import 'package:get/get.dart';

class ChatroomsController extends GetxController {
  final RxString selectedChatroom = ''.obs;
  final RxList<String> messages = <String>[].obs;
  
  void selectChatroom(String chatroomId) {
    selectedChatroom.value = chatroomId;
  }
  
  void sendMessage(String message) {
    messages.add(message);
  }
}

