// To parse this JSON data, do
//
//     final artifact = artifactFromMap(jsonString);

import 'dart:convert';

class Artifact {
  Artifact({
    required this.descripcion,
    required this.fecha,
    required this.imagen,
    required this.nombre,
    required this.sala,
    required this.titulo,
  });

  String descripcion;
  String fecha;
  String imagen;
  String nombre;
  String sala;
  String titulo;
  String? id;

  factory Artifact.fromJson(String str) => Artifact.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Artifact.fromMap(Map<String, dynamic> json) => Artifact(
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        sala: json["sala"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "fecha": fecha,
        "imagen": imagen,
        "nombre": nombre,
        "sala": sala,
        "titulo": titulo,
      };
}
