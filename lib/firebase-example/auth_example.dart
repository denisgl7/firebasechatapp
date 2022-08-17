import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Регистрация пользователя по email
  // UserCredential userCredential = await FirebaseAuth.instance
  //     .createUserWithEmailAndPassword(
  //         email: "otus@gmail.ru", password: "123456");
  // print(userCredential.user?.email);

  // Вход в систему по email
  // UserCredential userCredential = await FirebaseAuth.instance
  //     .signInWithEmailAndPassword(email: "otus@gmail.ru", password: "123456");
  // print(userCredential.user?.uid);


  /// Выход из системы
  // FirebaseAuth.instance.signOut();
}
