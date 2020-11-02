import 'package:flutter/material.dart';
import 'package:rentworker/InfoPage/info_screen.dart';
import 'package:rentworker/WorkDetail/workdetail_screen.dart';

class Body extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      height: size.height,
      child: Column(
        children: [
          Container(
            height: 78,
            color: Colors.blue,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
              leading: Image.asset(
                'assets/images/avt.png',
              ),
              title: Text(
                'Trần Trọng Tuấn',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text('Xin chào!'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen();
                }));
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Container(
                            child: ListView.separated(
                              itemCount: entries.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return WorkDetailScreen();
                                        }));
                                  },
                                  child: Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Icon(
                                                  Icons.add_alert,
                                                  color: Colors.blue,
                                                )
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 5),
                                                      child: Container(
                                                        height: 25,
                                                        child: Text(
                                                          'Công việc mới gần đây',
                                                          style: TextStyle(
                                                              fontSize: 18
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      child: Text(
                                                        'Bạn có 1 công việc mới',
                                                        style: TextStyle(
                                                            color: Colors.grey
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                            )),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),

      //
    );
  }
}
