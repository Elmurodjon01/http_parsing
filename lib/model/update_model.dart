class UpdateEmployee{
  String status;
  String message;
  UpdateEmployee.fromJson(Map<String,dynamic> json)
      : status = json['status'],
        message = json['message'];


  Map<String,dynamic> toJson() => {
    'status': status,
    'message': message,
  };
}