import 'dart:convert';

import 'package:test_task_one/core/constants.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final List<PersonEntity> _cache = [];

  Future<List<PersonEntity>> getPersons() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json, application/xml',
      //'Prefer': 'code=200, example=success' Prefer: code=500, example=error-500
      'Prefer': 'code=500, example=error-500'
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      _cache.clear();
      _cache.addAll(json['items']
          .map<PersonEntity>((e) => PersonEntity.fromJson(e)));
      return _cache;
    } else {
      throw Exception('status code != 200');
    }
  }

  List<PersonEntity> getCachedPersons() => _cache;
}
