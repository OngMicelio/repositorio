// To parse this JSON data, do
//
//     final rooms = roomsFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Rooms {
  Rooms(
      {required this.description,
      required this.image,
      required this.nameR,
      required this.number,
      required this.color});

  String description;
  String image;
  String nameR;
  int number;
  String color;

  factory Rooms.fromJson(String str) => Rooms.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rooms.fromMap(Map<String, dynamic> json) => Rooms(
        description: json["description"],
        image: json["image"],
        nameR: json["nameR"],
        number: json["number"],
        color: json["color"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "image": image,
        "nameR": nameR,
        "number": number,
        "color": color,
      };
}
