import 'package:flutter/material.dart';
import 'package:flutter_api_crud/models/employees.dart';
import 'detailwidget.dart';

class EmployeesList extends StatelessWidget {
  final List<Employees> employees;
  EmployeesList({Key key, this.employees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: employees == null ? 0 : employees.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(employees[index])),
              );
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(employees[index].name),
              subtitle: Text(employees[index].age.toString()),
            ),
          ));
        });
  }
}
