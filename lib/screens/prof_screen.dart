import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prof_list.dart';

class ProfScreen extends StatelessWidget {
  static const routeName = 'prof-screen';
  @override
  Widget build(BuildContext context) {
    //final profData = Provider.of<ProfList>(context);
    //final list = profData.list;
    int num = 0;

    List<Color> grad() {
      num += 1;
      if (num % 2 == 0) {
        return [Color(0xFFdcd6f7), Color(0xFFa1fcdf)];
      } else {
        return [Color(0xFFfbc3bc), Color(0xFFfbc3bc)];
      }
    }

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

    final mediaquery = MediaQuery.of(context);

    final prof = Provider.of<ProfList>(context).profList();
    final profList = Provider.of<ProfList>(context).list;
    print(profList);
    //print(profList);
    var scaffold = Scaffold(
      body: ListView.builder(
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
                            'profListId: ',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '${profList[index]['userId']}',
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      fieldInfo('Name ', profList[index]['name']),
                      SizedBox(
                        height: 8,
                      ),
                      //fieldInfo('Date of Joining ', profList[index].doj),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fieldInfo('Dept', profList[index]['dept']),
                            fieldInfo(
                                'Date of Joining ', profList[index]['DoJ'])
                          ]),
                      SizedBox(
                        height: 8,
                      ),
                      fieldInfo('Education', profList[index]['education'])
                    ]),
              ),
            ),
          );
        },
        itemCount: profList.length,
      ),
    );
    return scaffold;
  }
}
