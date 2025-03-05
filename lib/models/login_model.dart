import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordModel extends Equatable {
  final String service;
  final String phoneNumber;
  final String email;
  final String password;
  final DateTime time;

  // constructor
  const PasswordModel({
    required this.service,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.time,
  });

  // fromJson
  factory PasswordModel.fromJson(Map json) {
    return PasswordModel(
      service: json["service"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      password: json["password"],
      time: DateTime.parse(json["time"]),
    );
  }

  // toJson
  Map toJson() => {
        "service": service,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "time": time.toIso8601String(),
      };

  @override
  List get props => [time];
}

Future<void> savePasswords(List<PasswordModel> passwords) async {
  final db = await SharedPreferences.getInstance();
  List jsonList = passwords.map((model) => model.toJson()).toList();
  String data = jsonEncode(jsonList);
  await db.setString("password", data);
}

Future<List<PasswordModel>> getPasswords() async {
  final db = await SharedPreferences.getInstance();
  String? data = db.getString("password");
  List<PasswordModel> result = [];
  if (data != null) {
    List jsonList = List.from(jsonDecode(data));
    result = jsonList.map((json) => PasswordModel.fromJson(json)).toList();
  }
  return result;
}

Future<void> deletePassword(PasswordModel password) async {
  final passwords = await getPasswords();
  passwords.removeWhere((model) => model == password);
  await savePasswords(passwords);
}

Future<void> createPassword(PasswordModel password) async {
  final passwords = await getPasswords();
  passwords.removeWhere((model) => model == password);
  passwords.add(password);
  await savePasswords(passwords);
}



















