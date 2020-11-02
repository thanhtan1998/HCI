import 'package:flutter/material.dart';

class Worker {
  int id;
  String name;

  Worker(this.id, this.name);
}

List<Worker> listWorker = [
  Worker(1, "Thợ vi tính"),
  Worker(2, "Thợ điện lạnh"),
  Worker(3, "Thợ điện gia dụng"),
  Worker(4, "Thợ thông tắc cống"),
  Worker(5, "Thợ sửa ống nước")
];