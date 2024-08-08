import 'dart:convert';

import 'package:test_task_one/core/constants.dart';
import 'package:test_task_one/features/home/entities/user_entity.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<List<UserEntity>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json, application/xml',
      'Prefer': 'code=200, example=success'
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['items']
          .map<UserEntity>((e) => UserEntity.fromJson(e))
          .toList();
    } else {
      throw Exception('status code != 200');
    }
  }
}
