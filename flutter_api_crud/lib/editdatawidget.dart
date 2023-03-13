import 'package:flutter/material.dart';
import 'package:flutter_api_crud/services/api_service.dart';
import 'models/employees.dart';

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.employees);

  final Employees employees;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  final _salaryController = TextEditingController();
  final _jobController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void initState() {
    id = widget.employees.id;
    _nameController.text = widget.employees.name;
    _salaryController.text = widget.employees.salary;
    _jobController.text = widget.employees.job;
    _ageController.text = widget.employees.age.toString();
    _cityController.text = widget.employees.city;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
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
                              Text('Full Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Salary'),
                              TextFormField(
                                controller: _salaryController,
                                decoration: const InputDecoration(
                                  hintText: 'Salary',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Salary';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Job'),
                              TextFormField(
                                controller: _jobController,
                                decoration: const InputDecoration(
                                  hintText: 'Job',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter job';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Age'),
                              TextFormField(
                                controller: _ageController,
                                decoration: const InputDecoration(
                                  hintText: 'Age',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter age';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('City'),
                              TextFormField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  hintText: 'City',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter city';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
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
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    api.updateEmployees(
                                        id,
                                        Employees(
                                          name: _nameController.text,
                                          salary: _salaryController.text,
                                          job: _jobController.text,
                                          age: int.parse(_ageController.text),
                                          city: _cityController.text,
                                        ));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
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
      ),
    );
  }
}
