import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/prof_list.dart';
import './providers/phd_list.dart';
import './providers/resources_list.dart';
import './providers/aprof_list.dart';

import 'widgets/faculty_item.dart';
import './providers/faculty_list.dart';

import 'screens/prof_screen.dart';
import 'screens/faculty_screen.dart';
import 'screens/tabs_screen.dart';
import './backend/server.dart' as server;

void main() async {
  //await server.start();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AprofList(),
        ),
        ChangeNotifierProvider.value(
          value: ProfList(),
        ),
        ChangeNotifierProvider.value(
          value: ResourcesList(),
        ),
        ChangeNotifierProvider.value(
          value: PhdList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IIIT Dept. Info System',
        theme: ThemeData(
          primarySwatch: Colors.lime,
          accentColor: Color(0xFFffafcc),
          splashColor: Color(0xFFffafcc),
          textTheme:
              //073b4c
              TextTheme(
                  headline6: TextStyle(
                      //decoration: TextDecoration.lineThrough,
                      fontSize: 22.5,
                      fontFamily: 'Asap',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.headline6.color),
                  headline5: TextStyle(
                    color: Color(0xFF202c39),
                    fontSize: 22.5,
                    fontFamily: 'Asap',
                    fontWeight: FontWeight.w400,
                  ),
                  headline4: TextStyle(
                    //decoration: TextDecoration.lineThrough,
                    fontSize: 18.5,
                    fontFamily: 'Asap',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.headline6.color,
                  ),
                  headline3: TextStyle(
                    color: Color(0xFF202c39),
                    fontSize: 18.5,
                    fontFamily: 'Asap',
                    fontWeight: FontWeight.w400,
                  )),
        ),
        home: TabsScreen(),
        routes: {
          FacultyScreen.routeName: (ctx) => FacultyScreen(),
          FacultyItem.routeName: (ctx) => FacultyItem(),
          ProfScreen.routeName: (ctx) => ProfScreen()
        },
      ),
    );
  }
}
