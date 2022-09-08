import 'package:http_parsing/model/get_model.dart';


class EmpList {

  String status;
  String message;
  List<Employee> data;

  EmpList.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = List<Employee>.from(json["data"].map((x) => Employee.fromJson(x)));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };

}