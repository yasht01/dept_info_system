import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http/http.dart' as http;

class AprofList with ChangeNotifier {
  String url = 'http://localhost:3000/listPage/Aprof';
  List<Map<String, dynamic>> _aprofList = [];

  Future<void> aprofList() async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print(extractedData['list']);
      _aprofList = extractedData['list'];
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  List<Map<String, dynamic>> get list {
    return [..._aprofList];
  }
}
