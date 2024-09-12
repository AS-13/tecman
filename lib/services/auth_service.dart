import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'https://example.com';

class AuthService {
  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return 'Login successful';
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return 'Registration successful';
    } else {
      throw Exception('Failed to register');
    }
  }
}
