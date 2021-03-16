import 'package:flutter/material.dart';

import 'faculty_screen.dart';
import '../backend/server.dart' as server;
import 'dept_home.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool _isLoading = true;
  //bool _isPage = false;

  List<Map<String, dynamic>> _pages;
  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    serverCall();
    super.initState();
    _pages = [
      {'page': FacultyScreen(), 'title': 'Faculty'},
      {'page': DeptHome(), 'title': 'Departments'},
    ];
  }

  Future<void> serverCall() async {
    await server.start();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _pages[_selectedPage]['page'],
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomNavigationBar(
            iconSize: 30.0,
            currentIndex: _selectedPage,
            onTap: _selectPage,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 18,
            selectedFontSize: 20,
            selectedLabelStyle: TextStyle(color: Colors.black),
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.school), label: 'Faculty'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Dept'),
            ]),
      ),
    );
  }
}
