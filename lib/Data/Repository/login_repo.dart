import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepo {
  Future<List<Map<String, dynamic>>> login(String email) async {
    try {
      http.Response res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);

        return Future.value(data.cast<Map<String, dynamic>>());
      } else {
        return Future.error('API request failed');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
