import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'model.dart';

class Repository extends ChangeNotifier {
  final String url = dotenv.env['URL'] as String;

  Future<List<Model>> fetchData() async {
    try {
      Dio dio = Dio();
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        List<Model> list = data
            .map(
              (e) => Model.fromJson(
                json.encode(e),
              ),
            )
            .toList();
        list.sort((a, b) => a.gen.compareTo(b.gen));
        notifyListeners();
        return list;
      } else {
        notifyListeners();
        throw Exception('Failed to load list');
      }
    } catch (e) {
      notifyListeners();
      throw Exception(e.toString());
    }
  }
}
