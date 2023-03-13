import 'dart:convert';
import 'package:flutter_api_crud/models/employees.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "http://127.0.0.1:3000/employees";

  Future<List<Employees>> getEmployees() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Employees> employees =
          body.map((dynamic item) => Employees.fromJson(item)).toList();
      return employees;
    } else {
      throw "Failed to load employees list";
    }
  }

  Future<Employees> getEmployeeById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return Employees.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a employee');
    }
  }

  Future<Employees> createemployee(Employees employees) async {
    Map data = {
      'name': employees.name,
      'salary': employees.salary,
      'job': employees.job,
      'age': employees.age,
      'city': employees.city
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Employees.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Employees> updateEmployees(String id, Employees employees) async {
    Map data = {
      'name': employees.name,
      'salary': employees.salary,
      'job': employees.job,
      'age': employees.age,
      'city': employees.city
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Employees.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a Employee');
    }
  }

  Future<void> deleteEmployee(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Employee deleted");
    } else {
      throw "Failed to delete a Employee.";
    }
  }
}
