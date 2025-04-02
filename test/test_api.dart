import 'package:dio/dio.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

void main() async {
  final token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNjk1MTIwLCJpYXQiOjE3NDM2MDg3MjAsImp0aSI6IjYxMGViNDViMGJkMTQ0YzE5Mzc5ZGQ0ZTU5MjdjYzhmIiwidXNlcl9pZCI6MTl9.SmaztEwAyMJPFYO-H2dLvC4J-5bGqNhYwFVrgn49rZk';

  ApiService api = ApiService(Dio());
  final response = await api.getCurrentUser(token);
  print(response);
}