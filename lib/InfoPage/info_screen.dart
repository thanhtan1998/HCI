import 'package:flutter/material.dart';
import 'package:rentworker/InfoPage/components/body.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
