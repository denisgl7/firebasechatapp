import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Обращение к коллекции
  // FirebaseFirestore.instance.collection('chats').snapshots().listen((event) {
  //   print(event.docs[0]['username']);
  // });

  //Добавление документа в коллекцию

  // FirebaseFirestore.instance.collection('chats').add({
  //   'text': 'Добрый день',
  //   'createAt': Timestamp.now(),
  //   'userId': 1234,
  //   'username': 'denis',
  //   'userImage': '',
  // });

  //Запрос с сортировкой
  Stream<QuerySnapshot<dynamic>> chatSnapshot = FirebaseFirestore.instance
      .collection('chats')
      .orderBy('createAt', descending: true)
      .snapshots();
  chatSnapshot.listen((event) {
    print(event.docs.map((e) => e['text']));
  });
}
