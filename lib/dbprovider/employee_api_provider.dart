import 'package:dio/dio.dart';

import 'package:flutter_ml/dbprovider/dbprovider.dart';
import 'package:flutter_ml/models/employee.dart';

class EmployeeApiProvider {
  Future<List<Employee>> getAllEmployees() async {
    var url = "http://demo8161595.mockable.io/employee";
    Response response = await Dio().get(url);

    return (response.data as List).map((employee) {
      print('Inserting $employee');
      DBProvider.db.createEmployee(Employee.fromJson(employee));
    }).toList();
  }
}