import 'package:app_museo_1/models/models.dart';
import 'package:app_museo_1/windgets/list_rooms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/rooms_services.dart';
import '../windgets/widgets.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final roomsService = Provider.of<RoomsService>(context);
    final size = MediaQuery.of(context).size;

    int totalRegistros = roomsService.rooms.length;
    return Column(children: [
      Container(
          height: size.height * 0.58,
          width: size.width,
          /* decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/plano_pintado.png'),
                    fit: BoxFit.contain)), */
          child: _mapa()),
      //espacio de la table de la sala
      Container(
        height: size.height * 0.3433,
        //color: Colors.black87,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: totalRegistros,
                itemBuilder: (_, int index) {
                  return _ListRoomss(
                    micolor: Colors.lightBlue.shade800,
                    name: 'Sala Patronal',
                    nroom: '1',
                    rooms: roomsService.rooms[index],
                  );
                },
              ),
            )
          ],
        ),
      )
    ]);
  }

  Stack _mapa() {
    return Stack(
      children: [
        Image(
          image: AssetImage('assets/plano_pintado.png'),
          fit: BoxFit.cover,
        ),
        Table(children: [
          TableRow(children: [
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            CuadradoBtn(micolor: Colors.blue.shade800, label: "1"),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            CuadradoBtn(micolor: Colors.purple.shade800, label: "2"),
            Cuadrado(micolor: Colors.black12),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            CuadradoBtn(micolor: Colors.red.shade800, label: "3"),
            Cuadrado(micolor: Colors.black87),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            CuadradoBtn(micolor: Colors.yellow.shade600, label: "4"),
            Cuadrado(micolor: Colors.black54),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black12),
            CuadradoBtn(micolor: Colors.orange.shade800, label: "8"),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            CuadradoBtn(micolor: Colors.purple.shade300, label: "7"),
            Cuadrado(micolor: Colors.black54),
            CuadradoBtn(micolor: Colors.grey, label: "6"),
            Cuadrado(micolor: Colors.black54),
            CuadradoBtn(micolor: Colors.green.shade800, label: "5"),
            Cuadrado(micolor: Colors.black12),
          ]),
          TableRow(children: [
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black54),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black87),
            Cuadrado(micolor: Colors.black12),
            Cuadrado(micolor: Colors.black),
          ]),
        ]),
      ],
    );
  }
}

class Cuadrado extends StatelessWidget {
  final Color micolor;

  const Cuadrado({
    super.key,
    required this.micolor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.125,
      width: size.width * 0.125,
      //color: micolor,
    );
  }
}

class CuadradoBtn extends StatelessWidget {
  final Color micolor;
  final String label;

  const CuadradoBtn({
    super.key,
    required this.micolor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: size.width * 0.125,
        width: size.width * 0.125,
        color: micolor,
        child: TextButton(
            onPressed: () => {},
            child: Container(
                color: micolor,
                child: Text(label,
                    style: TextStyle(color: Colors.white, fontSize: 11)))),
      ),
    );
  }
}

class _ListRoomss extends StatelessWidget {
  final Color micolor;
  final String name;
  final String nroom;

  final Rooms rooms;
  const _ListRoomss(
      {super.key,
      required this.micolor,
      required this.name,
      required this.nroom,
      required this.rooms});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Color> colors = [
      Colors.black,
      Colors.blue.shade800,
      Colors.purple.shade800,
      Colors.red.shade800,
      Colors.yellow.shade600,
      Colors.green.shade800,
      Colors.grey,
      Colors.purple.shade300,
      Colors.orange.shade800,
    ];
    //Color colors = Color(int.parse(rooms.color));
    return Container(
      //color: colors,
      width: size.width,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              color: colors[rooms.number],
              height: size.height * 0.05,
              width: size.width * 0.10,
              child: Center(
                child: Text(
                  rooms.number.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: colors[rooms.number],
                  height: size.height * 0.05,
                  width: size.width * 0.80,
                  child: Center(
                    child: Text(
                      rooms.nameR,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
