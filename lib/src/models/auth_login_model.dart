// To parse this JSON data, do
//
//     final authLoginModel = authLoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AuthLoginModel authLoginModelFromJson(String str) => AuthLoginModel.fromJson(json.decode(str));

String authLoginModelToJson(AuthLoginModel data) => json.encode(data.toJson());

class AuthLoginModel {
  final String token;

  AuthLoginModel({
    required this.token,
  });

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) => AuthLoginModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}