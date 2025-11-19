import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/presentation/controllers/chatrooms_controller.dart';

class ChatroomsScreen extends StatelessWidget {
  const ChatroomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatroomsController controller = Get.put(ChatroomsController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fan Chatrooms'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💬 Join the Conversation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Chat with fans from around the world',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⚽ Club Chatrooms',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'arsenal',
              name: 'Arsenal Fans',
              members: '45.2K',
              onlineCount: '2.3K',
              lastMessage: 'What a goal by Saka! 🔥',
              timeAgo: '2m ago',
              iconColor: Colors.red,
            ),
            const SizedBox(height: 12),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'chelsea',
              name: 'Chelsea FC',
              members: '38.5K',
              onlineCount: '1.8K',
              lastMessage: 'We need a new striker ASAP',
              timeAgo: '5m ago',
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 12),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'mancity',
              name: 'Manchester City',
              members: '52.1K',
              onlineCount: '3.1K',
              lastMessage: 'Haaland is unstoppable 💪',
              timeAgo: '8m ago',
              iconColor: const Color(0xFF6CABDD),
            ),
            const SizedBox(height: 12),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'liverpool',
              name: 'Liverpool FC',
              members: '48.9K',
              onlineCount: '2.7K',
              lastMessage: 'YNWA! Up the Reds! ❤️',
              timeAgo: '10m ago',
              iconColor: const Color(0xFFC8102E),
            ),
            const SizedBox(height: 24),
            const Text(
              '🏆 League Chatrooms',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'premier',
              name: 'Premier League',
              members: '125.8K',
              onlineCount: '8.5K',
              lastMessage: 'Best league in the world!',
              timeAgo: '3m ago',
              iconColor: AppTheme.accentPurple,
            ),
            const SizedBox(height: 12),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'laliga',
              name: 'La Liga 2025',
              members: '98.3K',
              onlineCount: '5.2K',
              lastMessage: 'El Clásico predictions?',
              timeAgo: '7m ago',
              iconColor: AppTheme.warningOrange,
            ),
            const SizedBox(height: 12),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'ucl',
              name: 'Champions League',
              members: '156.7K',
              onlineCount: '12.4K',
              lastMessage: 'Can\'t wait for the final!',
              timeAgo: '12m ago',
              iconColor: AppTheme.accentBlue,
            ),
            const SizedBox(height: 12),
            _buildChatroomCard(
              controller: controller,
              chatroomId: 'bundesliga',
              name: 'Bundesliga',
              members: '67.4K',
              onlineCount: '3.8K',
              lastMessage: 'Bayern dominance continues',
              timeAgo: '15m ago',
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatroomCard({
    required ChatroomsController controller,
    required String chatroomId,
    required String name,
    required String members,
    required String onlineCount,
    required String lastMessage,
    required String timeAgo,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        controller.selectChatroom(chatroomId);
        _showChatroomBottomSheet(
          controller: controller,
          name: name,
          onlineCount: onlineCount,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        timeAgo,
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppTheme.primaryGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$onlineCount online',
                        style: const TextStyle(
                          color: AppTheme.primaryGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.people_outline,
                        color: AppTheme.textSecondary,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$members members',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatroomBottomSheet({
    required ChatroomsController controller,
    required String name,
    required String onlineCount,
  }) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.85,
        decoration: const BoxDecoration(
          color: AppTheme.darkBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppTheme.textSecondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: AppTheme.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.primaryGreen,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '$onlineCount online',
                                  style: const TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildChatMessage(
                    'FootballFan23',
                    'What a match! Arsenal is playing amazing today! 🔥',
                    '10:45 AM',
                    false,
                  ),
                  const SizedBox(height: 16),
                  _buildChatMessage(
                    'GoalKeeper99',
                    'Agreed! Saka is on fire 🎯',
                    '10:46 AM',
                    false,
                  ),
                  const SizedBox(height: 16),
                  _buildChatMessage(
                    'You',
                    'Best performance this season!',
                    '10:47 AM',
                    true,
                  ),
                  const SizedBox(height: 16),
                  _buildChatMessage(
                    'Arsenal_Legend',
                    'This is the Arsenal we love to see! 💪',
                    '10:48 AM',
                    false,
                  ),
                  const SizedBox(height: 16),
                  _buildChatMessage(
                    'RedDevil7',
                    'They\'re looking unstoppable right now',
                    '10:49 AM',
                    false,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppTheme.cardBackground,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: const TextStyle(color: AppTheme.textSecondary),
                        filled: true,
                        fillColor: AppTheme.darkBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildChatMessage(String username, String message, String time, bool isMe) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMe) ...[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                username[0].toUpperCase(),
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isMe)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    username,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isMe
                      ? AppTheme.primaryGreen
                      : AppTheme.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.black : AppTheme.textPrimary,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        if (isMe) ...[
          const SizedBox(width: 12),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.accentBlue.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'Y',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

