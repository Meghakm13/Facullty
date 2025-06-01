import 'dart:convert';
import 'dart:developer';
// import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/faculty_model.dart';

class FacultyService {
  static const String baseUrl = 'http://172.16.3.213:3001/faculty';

  // GET all faculty
  static Future<List<Faculty>> getAllFaculties() async {
    final response = await http.get(Uri.parse(baseUrl));
    log(response.statusCode.toString(), name: "mmmm");
    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData.map((item) => Faculty.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load faculty data');
    }
  }

  // POST new faculty
  static Future<void> addFaculty(Faculty faculty) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(faculty.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add faculty');
    }
  }

  // PUT update faculty
  static Future<void> updateFaculty(String id, Faculty faculty) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(faculty.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update faculty');
    }
  }

  // DELETE faculty
  static Future<void> deleteFaculty(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete faculty');
    }
  }
}
