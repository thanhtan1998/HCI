import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentworker/LoginPage/components/background.dart';
import 'package:rentworker/MainPage/main_screen.dart';
import 'package:rentworker/SignupPage/signup_screen.dart';
import 'package:rentworker/components/already_have_account_check.dart';
import 'package:rentworker/components/rounded_button.dart';
import 'package:rentworker/components/rounded_input_field.dart';
import 'package:rentworker/components/rounded_password_field.dart';
import 'package:rentworker/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Chào mừng bạn đến với Thợ Tốt",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Địa chỉ Email/SĐT",
              onChanged: (value) {},
            ),
            // SizedBox(
            //   height: size.height * 0.00,
            // ),
            RoundedPasswordField(
              hintText: 'Mật khẩu',
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: 'Đăng Nhập',
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainScreen();
                }));
              },
              color: kPrimaryColor,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            AlreadyHaveAccountCheck(
              login: true,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
