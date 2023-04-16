import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
  // var response = await http.get(Uri.parse("http://127.0.0.1:8000/home"));
  var response =
      await http.post(Uri.parse("http://127.0.0.1:8000/home"), body: {
    "username": "John",
    "password": "pascal",
    "email": "john@gmail.com",
  });

  print(jsonDecode(response.body));
}
