import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:section14/widgets/chat_messages.dart';
import 'package:section14/widgets/new_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _appSignOut() async {
    var response = await FirebaseAuth.instance.signOut();

    // print('appSignOut response: ${response}');
  }

  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    final notificationSetting = await fcm.requestPermission();
    // notificationSetting

   final token = await fcm.getToken();

   print('Firebase Messaging Token:\t$token');
   
   
   fcm.subscribeToTopic('chat');


  }

  @override
  void initState() {
    super.initState();

    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: [
          IconButton(
              onPressed: _appSignOut,
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatMessages()),
          NewMessages(),
        ],
      ),
    );
  }
}
