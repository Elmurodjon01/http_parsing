import 'package:http_parsing/model/employee.dart';

class Emplist {
  String status;
  String message;
  List<Employee> data;

  Emplist.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data =
            List<Employee>.from(json['data'].map((x) => Emplist.fromJson(x)));

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson()))
      };
}
