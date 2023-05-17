// To parse this JSON data, do
//
//     final publication = publicationFromMap(jsonString);

import 'dart:convert';

class Publication {
  Publication({
    required this.autor,
    required this.descripcion,
    required this.fecha,
    required this.imagen,
    required this.subtitulo,
    required this.titulo,
  });

  String autor;
  String descripcion;
  String fecha;
  String imagen;
  String subtitulo;
  String titulo;
  String? id;
  factory Publication.fromJson(String str) =>
      Publication.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Publication.fromMap(Map<String, dynamic> json) => Publication(
        autor: json["autor"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        imagen: json["imagen"],
        subtitulo: json["subtitulo"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toMap() => {
        "autor": autor,
        "descripcion": descripcion,
        "fecha": fecha,
        "imagen": imagen,
        "subtitulo": subtitulo,
        "titulo": titulo,
      };
}
