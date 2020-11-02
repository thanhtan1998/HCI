import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rentworker/ListWorkPage/listwork_screen.dart';
import 'package:rentworker/components/rounded_button.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  String searchAddress;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  void _searchAndNavigate() {
    if (searchAddress != null) {
      Geolocator().placemarkFromAddress(searchAddress).then((result) {
        _mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    result[0].position.latitude, result[0].position.longitude),
                zoom: 16)));
        _markers.clear();
        _markers.add(new Marker(
          markerId: MarkerId("0"),
          position:
              LatLng(result[0].position.latitude, result[0].position.longitude),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xác nhận yêu cầu'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(10.841524, 106.810049), zoom: 16.0),
                  markers: _markers,
                  myLocationEnabled: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Tên khách hàng'),
                                    Text('Trần Trọng Tuấn',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Số điện thoại'),
                                    Text('0123456789',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Công việc'),
                                    Text('Lắp mới đèn lon',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ngày thực hiện'),
                                    Text('2/11/2020',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Địa chỉ làm việc'),
                            Text('Chung cư C7, đường Man Thiện, quận 9, thành phố Hồ Chí Minh, Việt Nam',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17))
                          ],
                        ),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Ghi chú',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Chi phí tạm tính',
                                        style: TextStyle(
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('100000',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: RoundedButton(
                      text: 'Đặt thợ',
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ListWorkScreen();
                        }));
                      },
                      color: kPrimaryColor,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
