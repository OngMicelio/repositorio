import 'dart:convert';

import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RoomsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-museo-default-rtdb.firebaseio.com';

  final List<Rooms> rooms = [];

  bool isLoading = true;

  RoomsService() {
    loadRooms();
  }

  Future loadRooms() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'rooms.json');
    final resp = await http.get(url);

    final Map<String, dynamic> roomsMap = json.decode(resp.body);
    roomsMap.forEach((key, value) {
      final tempRooms = Rooms.fromMap(value);
      tempRooms.nameR = key;
      this.rooms.add(tempRooms);
    });
    this.isLoading = false;
    notifyListeners();
  }
}
