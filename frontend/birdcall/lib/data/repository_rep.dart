import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class Repository extends ChangeNotifier {
  final String url = 'https://birdcall.zcursos.one/records_get/podekeyclay';

  Future<List<Model>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(url),
        //headers: {"Content-Type": "application / json; charset = UTF-8"},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(
          response.body,
        );

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
