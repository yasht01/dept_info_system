// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../models/faculty.dart';

// class FacultyList with ChangeNotifier {
//   List<Faculty> _prof = [];
//   List<Faculty> _aprof = [];
//   List<Faculty> _phd = [];
//   List<Faculty> _facultyList;

//   Future<List> getFacultyList(String type) async {
//     final String url = 'http://localhost:3000/listPage/$type';

//     notifyListeners();

//     return _facultyList;
//   }

//   Future<void> getProf(String type) async {
//     final String url = 'http://localhost:3000/listPage/$type';

//     try {
//       final response = await http.get(url);
//       final extractedData = json.decode(response.body);

//       //final loadedProducts = extractedData['list'] as List<Faculty>;
//       extractedData['list'].map((e) {
//         // print('e');
//         return _prof.add(Faculty.fromJson(e)
//             // (
//             //     userId: e['userId'],
//             //     name: e['name'],
//             //     edu: e['education'],
//             //     dept: e['dept'],
//             //     doj: e['DoJ'])
//             );
//       }).toList();
//       // _faculty = loadedProducts;
//       notifyListeners();
//       //_faculty = [];
//     } catch (error) {
//       print(error);
//     }
//   }

//   // Future<void> getAprof(String type) async {
//   //   final url = 'http://localhost:3000/listPage/$type';
//   //   try {
//   //     final response = await http.get(url);
//   //     final extractedData = json.decode(response.body);

//   //     //final loadedProducts = extractedData['list'] as List<Faculty>;
//   //     extractedData['list'].map((e) {
//   //       // print('e');
//   //       return _aprof.add(Faculty(
//   //           userId: e['userId'],
//   //           name: e['name'],
//   //           edu: e['education'],
//   //           dept: e['dept'],
//   //           doj: e['DoJ']));
//   //     }).toList();
//   //     // _faculty = loadedProducts;
//   //     notifyListeners();
//   //     //_faculty = [];
//   //   } catch (error) {
//   //     print(error);
//   //   }
//   // }

//   Future<void> getPhd(String type) async {
//     final String url = 'http://localhost:3000/listPage/$type';

//     try {
//       final response = await http.get(url);
//       final extractedData = json.decode(response.body);

//       //final loadedProducts = extractedData['list'] as List<Faculty>;
//       extractedData['list'].map((e) {
//         // print('e');
//         return _phd.add(Faculty(
//           userId: e['userId'],
//           name: e['name'],
//           edu: e['education'],
//           dept: e['dept'],
//           doj: e['DoJ'],
//           thesis: e['thesis'],
//         ));
//       }).toList();
//       // _faculty = loadedProducts;
//       notifyListeners();
//       //_faculty = [];
//     } catch (error) {
//       print(error);
//     }
//   }

//   void addProf(List<Map<String, String>> fac) {
//     List<Faculty> loadedFac = [];
//     fac.map((e) => loadedFac.add(Faculty.fromJson(e)));
//     print(loadedFac);
//     _prof = loadedFac;
//     print(_prof);
//     notifyListeners();
//   }

//   void addAprof(List<Map<String, String>> fac) {
//     List<Faculty> loadedFac = [];
//     fac.map((e) => loadedFac.add(Faculty.fromJson(e)));
//     print(loadedFac);
//     _aprof = loadedFac;
//     print(_aprof);
//     notifyListeners();
//   }

//   void addPhd(List<Map<String, String>> fac) {
//     List<Faculty> loadedFac = [];
//     fac.map((e) => loadedFac.add(Faculty.fromJson(e)));
//     print(loadedFac);
//     _phd = loadedFac;
//     print(_phd);
//     notifyListeners();
//   }

//   List<Faculty> get prof {
//     return [..._prof];
//   }

//   List<Faculty> get aprof {
//     return [..._aprof];
//   }

//   List<Faculty> get phd {
//     return [..._phd];
//   }
// }
