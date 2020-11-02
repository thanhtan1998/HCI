import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rentworker/ConfirmInfoPage/confirminfo_screen.dart';
import 'package:rentworker/InfoPage/info_screen.dart';
import 'package:rentworker/ShowProlemPage/components/showtest.dart';
import 'package:rentworker/ShowProlemPage/showproblem_screen.dart';
import 'package:rentworker/components/rounded_button.dart';

import '../../constants.dart';

class Gmap extends StatefulWidget{
  Gmap({Key key}) : super(key: key);

  @override
  _GmapState createState() => _GmapState();

}

class _GmapState extends State<Gmap> {

  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  String searchAddress;

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _mapController = controller;
    });
  }

  void _searchAndNavigate(){
    if(searchAddress != null) {
      Geolocator().placemarkFromAddress(searchAddress).then((result) {
        _mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    result[0].position.latitude, result[0].position.longitude),
                zoom: 16)
        ));
        _markers.clear();
        _markers.add(new Marker(
          markerId: MarkerId("0"),
          position: LatLng(
              result[0].position.latitude, result[0].position.longitude),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 80,
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
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(10.841524, 106.810049),
                    zoom: 16.0
                  ),
                  markers: _markers,
                  myLocationEnabled: true,
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Địa chỉ",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15, top: 15),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: _searchAndNavigate,
                        iconSize: 30,
                      )
                  ),
                  onChanged: (val){
                    setState(() {
                      searchAddress = val;
                    });
                  },
                ),
              ),

              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: RoundedButton(
                        text: 'Nhập thông tin',
                        press: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UploadImageDemo();
                          }));
                        },
                        color: kPrimaryColor
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: RoundedButton(
                        text: 'Tìm thợ',
                        press: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ConfirmInfoScreen();
                          }));
                        },
                        color: kPrimaryColor
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );

  }

}