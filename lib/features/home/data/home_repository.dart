import 'dart:convert';

import 'package:test_task_one/core/constants.dart';
import 'package:test_task_one/core/handle_error.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final List<PersonEntity> _cache = [];

  Future<List<PersonEntity>> getPersons() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json, application/xml',
      'Prefer': 'code=200, example=success' //success
      //'Prefer': 'code=500, example=error-500' //error
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      _cache.clear();
      _cache.addAll(
          json['items'].map<PersonEntity>((e) => PersonEntity.fromJson(e)));
      return _cache;
    } else {
      throw ServerError();
    }
  }

  List<PersonEntity> getCachedPersons() => _cache;
}
