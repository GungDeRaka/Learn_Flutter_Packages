import 'dart:convert';

import 'package:flutter_carousel_learn/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static String baseUrl = "https://reqres.in";

  static Future<List<User>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/users"),
      );
      final result = jsonDecode(response.body);
      List<User> users =
          List<User>.from(result.map((json) => User.fromJson(json)));
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
