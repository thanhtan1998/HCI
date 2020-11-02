
import 'package:flutter/material.dart';
import 'package:rentworker/components/worker.dart';

class Service {
  int workerId;
  String name;

  Service(this.workerId, this.name);
}
List<Service> listServices = [
  Service(1, "Cài hệ điều hành Windows / MacOS"),
  Service(1,  "Cài phần mềm văn phòng(MS Office)"),
  Service(1, "Sửa mạng tại nhà, cấu hình, modem, wifi"),
  Service(1, "Vệ Sinh máy tính tại nhà"),
  Service(2, "Lắp nguyên bộ máy lạnh treo tường"),
  Service(2, "Tháo nguyên bộ máy lạnh treo tường"),
  Service(2, "Vệ sinh máy lạnh treo tường"),
  Service(2, "Sạc gas/châm thêm"),
  Service(3, "Lắp mới đèn lon"),
  Service(3, "Sửa chập điện âm tường"),
  Service(3, "Sửa chập điện nổi"),
  Service(3, "Lắp đặt điện nổi"),
  Service(4, "Thông cống vệ sinh"),
  Service(4, "Xe hút bể phốt 1 khối"),
  Service(4, "Xe hút bể phốt 3 khối"),
  Service(4, "Xe hút bể phốt 5 khối"),
  Service(5, "Sửa đường ống âm bị bể"),
  Service(5, "Thay bộ xả lavabo"),
  Service(5, "Thay vòi nước"),
  Service(5, "Thông nghẹt lavabo, chậu rửa"),
];


