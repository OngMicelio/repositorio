import 'dart:convert';

import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArtifactService extends ChangeNotifier {
  final String _baseUrl = 'flutter-museo-default-rtdb.firebaseio.com';

  final List<Artifact> artifacts = [];

  bool isLoading = true;
  bool isSaving = false;

  ArtifactService() {
    loadArtifactt();
  }

  Future loadArtifactt() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'artifact.json');
    final resp = await http.get(url);

    final Map<String, dynamic> artifactsMap = json.decode(resp.body);
    artifactsMap.forEach((key, value) {
      final tempArtifact = Artifact.fromMap(value);
      tempArtifact.id = key;
      artifacts.add(tempArtifact);
    });
    isLoading = false;
    notifyListeners();
  }
}
