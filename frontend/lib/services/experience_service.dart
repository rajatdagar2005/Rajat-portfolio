import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Experience.dart';

class ExperienceService { //https://rajat-portfolio-xzsa.onrender.com/contact
  static const String apiUrl = 'https://rajat-portfolio-xzsa.onrender.com/experience'; // update if needed

  static Future<List<Experience>> fetchExperience() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Experience.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load experience data');
    }
  }
}
