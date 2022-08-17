import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат'),
        actions: [
          DropdownButton(
              underline: Container(),
              icon: Icon(Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color),
              items: [
                DropdownMenuItem(
                  child: Row(children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Выйти из аккаунта')
                  ]),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              })
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage()
        ],
      ),
    );
  }
}
