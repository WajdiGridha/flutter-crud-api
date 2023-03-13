import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'editdatawidget.dart';
import 'models/employees.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.employees);

  final Employees employees;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Name:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.employees.name,
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Salary:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.employees.salary,
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Job:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.employees.job,
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Age:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.employees.age.toString(),
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('City:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.employees.city,
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            ElevatedButton(
                              //splashColor: Colors.red,
                              onPressed: () {
                                _navigateToEditScreen(
                                    context, widget.employees);
                              },
                              child: Text('Edit',
                                  style: TextStyle(color: Colors.white)),
                              //color: Colors.blue,
                            ),
                            ElevatedButton(
                              //splashColor: Colors.red,
                              onPressed: () {
                                _confirmDialog();
                              },
                              child: Text('Delete',
                                  style: TextStyle(color: Colors.white)),
                              //color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Employees employees) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(employees)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                api.deleteEmployee(widget.employees.id);
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
