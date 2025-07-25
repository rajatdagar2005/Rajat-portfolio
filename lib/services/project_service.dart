import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/project.dart';

class ProjectService {
  final String _baseUrl = 'http://192.168.1.6:8080'; // Ktor backend

  // http://192.168.1.6:8080/project

  Future<List<Project>> fetchProjects() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/project'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Project.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to load projects. Status Code: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }
}
