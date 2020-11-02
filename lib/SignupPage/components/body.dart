import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentworker/LoginPage/login_screen.dart';
import 'package:rentworker/SignupPage/components/background.dart';
import 'package:rentworker/SignupSuccessPage/signup_screen.dart';
import 'package:rentworker/components/already_have_account_check.dart';
import 'package:rentworker/components/rounded_button.dart';
import 'package:rentworker/components/rounded_input_field.dart';
import 'package:rentworker/components/rounded_password_field.dart';
import 'package:rentworker/constants.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          "Đăng kí",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Image.asset("assets/images/signup.png", width: size.height * 0.35),
        RoundedInputField(
          hintText: 'Tên đăng nhập',
          onChanged: (value) {},
        ),
        RoundedInputField(
          hintText: 'Địa chỉ Email',
          icon: Icons.email,
          onChanged: (value) {},
        ),
        RoundedInputField(
          hintText: 'Số điện thoại',
          icon: Icons.phone,
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          hintText: "Mật Khẩu",
          onChanged: (value) {},
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedButton(
          text: "Đăng Kí",
          color: kPrimaryColor,
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignUpSuccessScreen();
            }));
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        AlreadyHaveAccountCheck(
          login: false,
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
        ),
      ]),
    );
  }
}
