import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class apiservice {
  Future<LoginApiresponce?> apicallLogin(Map<String, dynamic> param) async {
    var url = 'https://muhsappapi.greemgoldfpc.com/api/Login';
    var responce = await http.post(Uri.parse(url),
        body: jsonEncode(param),
        headers: <String, String>{'Content-Type': 'application/json'});

    print('Response status :${responce.statusCode == 0}');
    print('Response body :${responce.body}');
    final data = jsonDecode(responce.body);
    return LoginApiresponce(
        DATA: data["ResponseCode"], DATA1: data["ResponseMessage"]);
  }
}

class LoginApiresponce {
  final String? DATA;
  final String? DATA1;
  final String? MIDDEL_NAME;

  LoginApiresponce({this.DATA, this.DATA1 ,this.MIDDEL_NAME});
}
