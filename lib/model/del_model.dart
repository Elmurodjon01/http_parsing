class DelEmployee{
  String status;
  String message;
  int data;
  DelEmployee({
    required this.data,
    required this.message,
    required this.status,
  });

  DelEmployee.fromJson(Map<String, dynamic> json)
      :data = json['data'],
        message = json['message'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
    'data': data,
    'message': message,
    'status': status,
  };
}