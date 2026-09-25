import 'dart:convert';

class User {
  final String name;
  final int age;
  final List<String> skills;

  User({required this.name, required this.age, required this.skills});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      age: json['age'] as int,
      skills: List<String>.from(json['skills'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'skills': skills,
    };
  }
}

void main() {
  print('=== 8.3 Ручная сериализация JSON ===');

  Map<String, dynamic> incomingData = {
    'name': 'Gulstan',
    'age': 17,
    'skills': ['Flutter', 'Dart', 'Physics']
  };

  User user = User.fromJson(incomingData);
  print('Создан объект User: ${user.name}, возраст: ${user.age}');
  print('Навыки: ${user.skills.join(', ')}');

  String jsonOutput = jsonEncode(user.toJson());
  print('Сериализовано обратно в JSON строку: $jsonOutput');
}