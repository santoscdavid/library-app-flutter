import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:livraria_mobile/models/editora.dart';
import 'package:http/http.dart' as http;

class EditoraProvider with ChangeNotifier {
  // http://localhost:5000/api/v1/
  final _baseURL = 'http://localhost:5000/api/v1';

  Future<List<Editora>> loadEditoras() async {
    final response = await http.get(Uri.parse(_baseURL + '/Editora'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Editora> allEditoras = [];

    for (var editora in data) {
      allEditoras.add(Editora(
          id: editora['id'].toString(),
          nome: editora['nome'],
          cidade: editora['cidade']));
    }
    return allEditoras;
  }
}
