import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://imgs.search.brave.com/HdmpaqwEKZ-0DgcHk9aVEcIw_UVpODd2tmHYRc-W0yc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2EwLzgx/LzYwL2EwODE2MDA4/YWM0OTNiOTE1NGIy/NjQ0ZTUwM2Q2YTY1/LmpwZw'),
          ),
        ),
        title: const Text('Gwen 🕷️'),  
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.she )
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble( message: message);
                },

              ) 
            ),
            MessageFieldBox(
              // onValue: chatProvider.sendMessage //Also valid
              onValue: (value) => chatProvider.sendMessage(value),
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}