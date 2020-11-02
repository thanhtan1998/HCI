import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rentworker/BookingScreen/booking_screen.dart';
import 'package:rentworker/ShowProlemPage/components/listService.dart';
import 'package:rentworker/ShowProlemPage/components/listWorker.dart';
import 'package:rentworker/components/rounded_button.dart';
import 'package:rentworker/components/rounded_input_field.dart';
import 'package:rentworker/constants.dart';

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo({Key key}) : super(key: key);

  final String title = "Upload Image Demo";

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImageDemo> {


  List<String> _dropdownWorkers;
  List<String> _dropdownServices;
  String _selectedWorker;
  String _selectedService;

  void initState() {
    super.initState();
    _dropdownWorkers = buildListNameWorkers(listWorker);
    _dropdownServices =
        buildListNameServicesByWorker(listServices, listWorker.elementAt(0).id);
    _selectedWorker = _dropdownWorkers[0];
    _selectedService = _dropdownServices[0];
  }

  List<String> buildListNameWorkers(List list) {
    List<String> workers = List();
    for (Worker worker in list) {
      workers.add(worker.name);
    }
    return workers;
  }

  List<String> buildListNameServicesByWorker(List<Service> list, int id) {
    List<String> services = List();
    for (Service service in list) {
      if (service.workerId == id) {
        services.add(service.name);
      }
    }
    return services;
  }

  int getIdWorkerByName(String value) {
    for (Worker worker in listWorker) {
      if (worker.name.compareTo(value) == 0) {
        return worker.id;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bạn đang gặp vấn đề gì?"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedInputField(
                hintText: "Tên khách hàng",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Số điện thoại",
                onChanged: (value) {},
              ),
              Text(
                'Chọn loại thợ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                child: DropdownButton(
                  value: _selectedWorker,
                  items: _dropdownWorkers
                      .map((e) => new DropdownMenuItem(
                          value: e,
                          child: Text(e, overflow: TextOverflow.ellipsis,
                          )))
                      .toList(),
                  onChanged: (value) {
                    _selectedWorker = value;
                    setState(() {
                      _dropdownServices = buildListNameServicesByWorker(
                          listServices, getIdWorkerByName(value));
                      _selectedService = _dropdownServices[0];
                    });
                  },
                ),
              ),
              Text(
                'Chọn loại dịch vụ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                child: DropdownButton(
                  value: _selectedService,
                  items: _dropdownServices.map((e) {
                    return new DropdownMenuItem(
                        value: e,
                        child: new Text(e, overflow: TextOverflow.ellipsis));
                  }).toList(),
                  onChanged: (selected) {
                    _selectedService = selected;
                    setState(() {});
                  },
                ),
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
            ],
          ),
        ),
      ),
    );

  }
}
