import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<List<dynamic>> getUserData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw const Center(
    child: CircularProgressIndicator(),
  );
}
