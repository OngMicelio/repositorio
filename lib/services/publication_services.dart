import 'dart:convert';

import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PublicationService extends ChangeNotifier {
  final String _baseUrl = 'flutter-museo-default-rtdb.firebaseio.com';

  final List<Publication> publication = [];

  bool isLoading = true;

  PublicationService() {
    loadPublication();
  }
/*fa<List<Artictt>>    List<Artefacto>*/
  Future loadPublication() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'publications.json');
    final resp = await http.get(url);

    final Map<String, dynamic> publicationMap = json.decode(resp.body);
    publicationMap.forEach((key, value) {
      final tempPublication = Publication.fromMap(value);
      tempPublication.id = key;
      this.publication.add(tempPublication);
    });
    this.isLoading = false;
    notifyListeners();
  }
}
