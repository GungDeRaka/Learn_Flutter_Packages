import 'dart:convert';

import 'package:flutter_carousel_learn/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static String baseUrl = "https://reqres.in/api";

  static Future<List<User>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/users?page=2"),
      );
      var body = response.body;
      final result = jsonDecode(body);
      List<User> users =
          List<User>.from(result['data'].map((json) => User.fromJson(json)));
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
