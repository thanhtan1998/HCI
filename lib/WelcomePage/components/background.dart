import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top2.png',
              width: size.width * 0.3,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/images/main_bottom2.png',
                width: size.width * 0.2,
              )),
          Positioned(left: 0, right: 0, child: child)
        ],
      ),
    );
  }
}