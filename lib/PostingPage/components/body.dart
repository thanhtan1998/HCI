import 'package:flutter/material.dart';
import 'package:rentworker/InfoPage/info_screen.dart';
import 'package:rentworker/ShowProlemPage/showproblem_screen.dart';
import 'package:rentworker/components/posting_type.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.1,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
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
            Container(
              width: double.infinity,
              height: size.height * 0.055,
              decoration: BoxDecoration(color: Colors.blue),
              alignment: Alignment.center,
              child: Text(
                'Danh mục thợ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      PostingType(
                        color: Color(0xFFE8E8E8),
                        icon: 'assets/images/thomaylanh.png',
                        title: 'Thợ điện lạnh',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowProblemScreen();
                          }));
                        },
                      ),
                      PostingType(
                        color: Color(0xFFE8E8E8),
                        icon: 'assets/images/thodien.png',
                        title: 'Thợ điện gia dụng',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowProblemScreen();
                          }));
                        },
                      )
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      PostingType(
                        color: Color(0xFFE8E8E8),
                        icon: 'assets/images/thononguoc.png',
                        title: 'Thông tắc cống',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowProblemScreen();
                          }));
                        },
                      ),
                      PostingType(
                        color: Color(0xFFE8E8E8),
                        icon: 'assets/images/nuoc.png',
                        title: 'Thở sửa chữa nước',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowProblemScreen();
                          }));
                        },
                      )
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      PostingType(
                        color: Color(0xFFE8E8E8),
                        icon: 'assets/images/thovitinh.png',
                        title: 'Thợ sửa máy tính',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowProblemScreen();
                          }));
                        },
                      ),
                      PostingType(
                        color: Color(0xFFE8E8E8),
                        icon: 'assets/images/giupviec.png',
                        title: 'Giúp việc',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowProblemScreen();
                          }));
                        },
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
