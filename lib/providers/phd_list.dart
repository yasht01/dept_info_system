import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PhdList with ChangeNotifier {
  String url = 'http://localhost/3000/phd';
  List<Map<String, dynamic>> _phd = [];

  Future<void> phdList() async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print(extractedData);
      _phd = extractedData['list'];
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  List<Map<String, dynamic>> get list {
    return [..._phd];
  }
}
