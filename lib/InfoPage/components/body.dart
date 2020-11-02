import 'package:flutter/material.dart';
import 'package:rentworker/LoginPage/login_screen.dart';
import 'package:rentworker/MainPage/main_screen.dart';
import 'package:rentworker/components/rounded_button.dart';
import 'package:rentworker/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.03,
          ),
          Center(
            child: Container(
              width: size.width * 0.3,
              height: size.width * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey)),
              child: Image.asset('assets/images/avt.png'),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Center(
            child: Text(
              'Trần Trọng Tuấn',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          CustomListTitle(
            icon: Icons.home,
            title: 'Trang chủ',
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              }));
            },
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
            height: 1.0,
          ),
          CustomListTitle(
            icon: Icons.card_giftcard,
            title: 'Ví voucher',
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
            height: 1.0,
          ),
          CustomListTitle(
            icon: Icons.history,
            title: 'Lịch sử giao dịch',
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
            height: 1.0,
          ),
          CustomListTitle(
            icon: Icons.menu,
            title: 'Phương thức thanh toán',
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
            height: 1.0,
          ),
          CustomListTitle(
            icon: Icons.settings,
            title: 'Cài đặt',
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
            height: 1.0,
          ),
          CustomListTitle(
            icon: Icons.perm_phone_msg,
            title: 'Trợ giúp',
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
            height: 1.0,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
            text: 'Đăng Xuất',
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            color: kPrimaryColor,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Center(
            child: Text("Phiên bản 1.0.0"),
          )
        ],
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function press;
  const CustomListTitle({
    Key key,
    this.title,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Align(
        alignment: Alignment(-1.2, 0),
        child: Text(
          title,
          textAlign: TextAlign.left,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
