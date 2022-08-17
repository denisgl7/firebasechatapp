import 'package:flutter/material.dart';

void main() {
  const person1 = Person(name: 'John Doe', age: 15);
  final person2 = person1.copyWith(age: person1.age + 1);
}

@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
