import 'dart:convert';
import 'package:http/http.dart' as http;
import './backend/server.dart' as server;

// Future<List<Map<String, dynamic>>>
Future<void> getAprof() async {
  final url = 'http://localhost:3000/listPage/Aprof';
  final response = await http.get(url);
  final Map<String, dynamic> data = jsonDecode(response.body);

  var jsonData = data['list'];
  print(jsonData);
}

void main() async {
  await server.start();
  await getAprof();
  // print(data);
}
