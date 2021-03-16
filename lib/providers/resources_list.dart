import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResourcesList with ChangeNotifier {
  String url = 'http://localhost:3000/resources';

  List<Map<String, dynamic>> _rscList = [];
  Future<void> resourceList() async {
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    print(extractedData);
    _rscList = extractedData['list'];
    notifyListeners();
  }

  List<Map<String, dynamic>> get list {
    return [..._rscList];
  }
}
