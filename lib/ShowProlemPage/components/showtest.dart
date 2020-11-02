import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rentworker/BookingScreen/booking_screen.dart';
import 'package:rentworker/components/rounded_button.dart';
import 'package:rentworker/components/rounded_input_field.dart';
import 'package:rentworker/constants.dart';

import '../../constants.dart';

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo({Key key}) : super(key: key);

  final String title = "Upload Image Demo";

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImageDemo> {
  //
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      ImagePicker.pickImage(source: ImageSource.gallery).then((value) {
        common.selectedImg = value.readAsBytesSync();
      });
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(common.selectedImg);
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  static const List<String> serviceList = <String>['Sửa chữa', 'Lắp đặt'];
  String dropdownValue = serviceList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bạn đang gặp vấn đề gì?"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RoundedInputField(
              hintText: 'fasdfsvxc',
            ),
            RoundedInputField(
              hintText: 'ạnkvxcz',
            ),
            Text(
              'Chọn loại dịch vụ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              //icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: kPrimaryColor),
              underline: Container(
                height: 2,
                color: kPrimaryColor,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: serviceList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ListTile(
              // leading: Image.asset(
              //   'assets/images/avt.png',
              // ),
              title: Text(
                'Hình ảnh cụ thể',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // subtitle: Text('Xin chào!'),
              trailing: Icon(
                Icons.add_box,
                color: kPrimaryColor,
              ),
              onTap: chooseImage,
            ),
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              text: 'Tiếp tục',
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BookingScreen();
                }));
              },
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            // SizedBox(
            //   height: 20.0,
            // ),
          ],
        ),
      ),
    );
  }
}
