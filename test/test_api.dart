import 'package:dio/dio.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

void main() async {
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNTQwMDMwLCJpYXQiOjE3NDM0NTM2MzAsImp0aSI6IjZkNjFkOThkZmY3MDRiOTA5OGRmNDVjOTRkM2M4YzNiIiwidXNlcl9pZCI6MTl9.Q5JmWI72YeYvv0DvjRQwZGeuozK0aOD-JznuS7TBQuY';

  ApiService api = ApiService(Dio());
  final response = api.getCurrentUser(token);
  print(response);
}