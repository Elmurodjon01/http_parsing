class User {
  late String name;
  late String salary;
  late int age;
  User({required this.name, required this.salary, required this.age});
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'age': age,
        'name': name,
        'salary': salary,
      };
}
