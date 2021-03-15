import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/faculty_list.dart';
import '../models/faculty.dart';

class FacultyItem extends StatefulWidget {
  static const routeName = '/faculty-item';

  @override
  _FacultyItemState createState() => _FacultyItemState();
}

class _FacultyItemState extends State<FacultyItem> {
  List<Faculty> list;
  bool _isLoading = true;
  List<Faculty> faculty;

  Future<void> extData(BuildContext context, String type) async {
    faculty = await Provider.of<FacultyList>(context, listen: false)
        .getFacultyList(type);
  }

  int num = 0;

  List<Color> grad() {
    num += 1;
    if (num % 2 == 0) {
      return [Color(0xFFdcd6f7), Color(0xFFa1fcdf)];
    } else {
      return [Color(0xFFfbc3bc), Color(0xFFfbc3bc)];
    }
  }

  String type;
  String title;
  bool _isInit = true;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      title = ModalRoute.of(context).settings.arguments as String;
      if (title.startsWith('Prof')) {
        type = 'prof';
      } else if (title.startsWith('Assistant')) {
        type = 'Aprof';
      } else if (title.startsWith('Doc')) {
        type = 'phd';
      }
      extData(context, type);

      setState(() {
        _isLoading = false;
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);

    Widget fieldInfo(String field, String fac) {
      return Row(children: [
        Text(
          '$field: ',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          '$fac',
          // textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headline5,
        ),
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  height: mediaquery.size.height * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  width: double.infinity,
                  child: Card(
                    //color: Color(0xFF468faf),
                    elevation: 2.6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: grad()),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  'FacultyId: ',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  '${faculty[index].userId}',
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            fieldInfo('Name ', faculty[index].name),
                            SizedBox(
                              height: 8,
                            ),
                            //fieldInfo('Date of Joining ', faculty[index].doj),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  fieldInfo('Dept', faculty[index].dept),
                                  fieldInfo(
                                      'Date of Joining ', faculty[index].doj)
                                ]),
                            SizedBox(
                              height: 8,
                            ),
                            fieldInfo('Education', faculty[index].edu)
                          ]),
                    ),
                  ),
                );
              },
              itemCount: faculty.length,
            ),
    );
  }
}
