import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy('createAt', descending: true)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = chatSnapshot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx, index) => MessageBubble(
                chatDocs[index]['text'],
                chatDocs[index]['username'],
                chatDocs[index]['userImage'],
                chatDocs[index]['userId'] ==
                    FirebaseAuth.instance.currentUser?.uid,
                key: ValueKey(chatDocs[index].id)),
          );
        });
  }
}
