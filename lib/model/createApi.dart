import 'delete_employee_model.dart';

class CreateApi {
  String status;
  String message;
  DeleteEmployee data;


  CreateApi.fromJson(Map<String,dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = DeleteEmployee.fromJson(json['data']);


  Map<String,dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}