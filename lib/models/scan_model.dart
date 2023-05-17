// To parse this JSON data, do
//
//     final scanModel2 = scanModel2FromJson(jsonString);

import 'dart:convert';

ScanModel2 scanModel2FromJson(String str) =>
    ScanModel2.fromJson(json.decode(str));

String scanModel2ToJson(ScanModel2 data) => json.encode(data.toJson());

class ScanModel2 {
  ScanModel2({
    this.autor,
    this.descripcion,
    this.fecha,
    this.imagen,
    this.subtitulo,
    this.titulo,
  });

  String? autor;
  String? descripcion;
  String? fecha;
  String? imagen;
  String? subtitulo;
  String? titulo;

  factory ScanModel2.fromJson(Map<String, dynamic> json) => ScanModel2(
        autor: json["autor"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        imagen: json["imagen"],
        subtitulo: json["subtitulo"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "autor": autor,
        "descripcion": descripcion,
        "fecha": fecha,
        "imagen": imagen,
        "subtitulo": subtitulo,
        "titulo": titulo,
      };
}
