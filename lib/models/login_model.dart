import 'package:equatable/equatable.dart';

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
