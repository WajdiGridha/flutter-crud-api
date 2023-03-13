class Employees {
  final String id;
  final String name;
  final String salary;
  final String job;
  final int age;
  final String city;

  Employees({
    this.id,
    this.name,
    this.salary,
    this.job,
    this.age,
    this.city,
  });

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
      id: json['_id'] as String,
      name: json['name'] as String,
      salary: json['salary'] as String,
      job: json['job'] as String,
      age: json['age'] as int,
      city: json['city'] as String,
    );
  }

  @override
  String toString() {
    return 'Employees{id: $id, name: $name, salary: $salary, job: $job, age: $age, city: $city}';
  }
}
