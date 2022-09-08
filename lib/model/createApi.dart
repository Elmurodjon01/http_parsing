import 'create_model.dart';

class CreateApi {
  String status;
  String message;
  CreateEmployee data;


  CreateApi.fromJson(Map<String,dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = CreateEmployee.fromJson(json['data']);


  Map<String,dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}