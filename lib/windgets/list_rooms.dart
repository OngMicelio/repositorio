import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

import '../services/services.dart';

class ListRooms extends StatelessWidget {
  const ListRooms({super.key});

  @override
  Widget build(BuildContext context) {
    final roomsService = Provider.of<RoomsService>(context);
    final size = MediaQuery.of(context).size;

    int totalRegistros = roomsService.rooms.length;

    return Container(
      height: size.height * 0.9,
      color: Colors.black54,
      child: Column(
        children: [
          /*  SizedBox(
            height: size.height * 0.35,
          ), */
          Expanded(
            child: ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: totalRegistros,
              itemBuilder: (_, int index) {
                return MakeRooms(
                  rooms: roomsService.rooms[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
