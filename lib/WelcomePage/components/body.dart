import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentworker/LoginPage/login_screen.dart';
import 'package:rentworker/components/rounded_button.dart';
import 'package:rentworker/constants.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          Text(
            'WELCOME TO RENT WORKER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kPrimaryColor),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'assets/icons/chat.svg',
            height: size.height * 0.45,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            text: "LOGIN",
            color: kPrimaryColor,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            text: "SIGN UP",
            color: kPrimaryLightColor,
            press: () {},
            //Navigator.push(context, MaterialPageRoute(builder: (context) {
            //return SignUpScreen();
            textColor: Colors.black,
          )
        ]),
      ),
    );
  }
}
