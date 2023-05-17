import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';

class ScanService extends ChangeNotifier {
  final String _baseUrl = 'flutter-museo-default-rtdb.firebaseio.com/artifact';

  final List<Artifact> artifacts = [];

  bool isLoading = true;
  bool isSaving = false;

  ScanService() {
    loadService();
  }

  Future loadService() async {
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

    return artifacts;
  }

  Future saveOrCreateArtifact(Artifact artifact) async {
    isSaving = true;
    notifyListeners();

    if (artifact.id == null) {
//crear
      await createArtifact(artifact);
    } else {
      //actualizar
      await updateArtifact(artifact);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateArtifact(Artifact artifact) async {
    final url = Uri.https(_baseUrl, 'artifact/${artifact.id}.json');
    final resp = await http.put(url, body: artifact.toJson());
    final decodedData = resp.body;

    final index = artifacts.indexWhere((element) => element.id == artifact.id);
    artifacts[index] = artifact;

    return artifact.id!;
  }

  Future<String> createArtifact(Artifact artifact) async {
    final url = Uri.https(_baseUrl, 'artifact.json');
    final resp = await http.post(url, body: artifact.toJson());
    final decodedData = json.decode(resp.body);

    artifact.id = decodedData['nombre'];

    artifacts.add(artifact);

    return artifact.id!;
  }
}
