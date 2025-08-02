import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/contact_model.dart';

class ContactService {
  static Future<ContactModel?> fetchContact() async {
    try { //https://rajat-portfolio-xzsa.onrender.com
      final response = await http.get(Uri.parse("https://rajat-portfolio-xzsa.onrender.com/contact"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return ContactModel.fromJson(jsonData[0]); // since it's a list with one item
      } else {
        print('Failed to load contact data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching contact: $e');
      return null;
    }
  }
}
