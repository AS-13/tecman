import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_tecman/services/auth_service.dart';

class DataService {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/get-data'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
