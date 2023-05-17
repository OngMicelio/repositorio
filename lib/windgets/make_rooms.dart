import 'package:flutter/material.dart';

import '../models/models.dart';

class MakeRooms extends StatelessWidget {
  final Rooms rooms;

  const MakeRooms({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  // contenedor de ka imagen de la sala
                  height: size.height * 0.15,
                  width: size.width * 0.35,
                  color: Colors.white10,
                  child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(rooms.image),
                      fit: BoxFit.cover)),
              Container(
                //contenedor  del texto de la sala
                height: size.height * 0.15,
                width: size.width * 0.65,
                color: Colors.white24,
                child: Column(children: [
                  Text(rooms.nameR,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Text(
                      rooms.description,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ]),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.005,
          )
        ],
      ),
    );
  }
}
