
class DeleteEmployee{
  String name;
  int salary;
  int age;
  int id;
  DeleteEmployee({
    required this.id,
    required this.salary,
    required this.age,
    required this.name,
  });

  DeleteEmployee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        salary = json['salary'],
        age = json['age'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'salary': salary,
    'age': age,
    'name': name,
  };
}
