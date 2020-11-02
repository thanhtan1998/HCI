import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Worker{
  Worker({
    this.name,
    this.phone,
    this.address,
    this.description,
    this.location,
  });

  String name;
  String phone;
  String address;
  String description;
  LatLng location;

  final List<Worker> workerList = [
    Worker(
      name: 'Nam',
      phone: '0123456789',
      address: 'Man thiện',
      description: 'Chuyên sửa chữa',
      location: LatLng(10.851524, 106.840049)
    ),
    Worker(
        name: 'Nam',
        phone: '0123456789',
        address: 'Man thiện',
        description: 'Chuyên sửa chữa',
        location: LatLng(10.861524, 106.850049)
    ),
    Worker(
        name: 'Nam',
        phone: '0123456789',
        address: 'Man thiện',
        description: 'Chuyên sửa chữa',
        location: LatLng(10.871524, 106.860049)
    ),
    Worker(
        name: 'Nam',
        phone: '0123456789',
        address: 'Man thiện',
        description: 'Chuyên sửa chữa',
        location: LatLng(10.881524, 106.870049)
    ),
    Worker(
        name: 'Nam',
        phone: '0123456789',
        address: 'Man thiện',
        description: 'Chuyên sửa chữa',
        location: LatLng(10.891524, 106.880049)
    )


  ];
}



