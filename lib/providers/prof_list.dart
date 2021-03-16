import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProfList with ChangeNotifier {
  String url = 'http://localhost:3000/listPage/prof';
  List<Map<String, dynamic>> _prof = [];

  Future<void> profList() async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print(extractedData);
      _prof = extractedData['list'];
    } catch (error) {
      print(error);
    }
  }

  List<Map<String, dynamic>> get list {
    return [..._prof];
  }
}
