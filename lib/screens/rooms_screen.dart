import '../windgets/rooms_slider.dart';
import 'package:app_museo_1/services/artifact_services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final artifactService = Provider.of<ArtifactService>(context);

    int totalRegistros1 = 0;
    List index1 = [];
    int totalRegistros2 = 0;
    List index2 = [];
    // if (artifactService.isLoading) return LoadingScreen();

    //evaluamos la sala de la peticion a provider y
    //contamos y rescatamos el largo e indice
    for (var i = 0; artifactService.artifacts.length > i; i++) {
      if (artifactService.artifacts[i].sala == "Sala 1") {
        index1.add(i);
        totalRegistros1 = totalRegistros1 + 1;
      }
      if (artifactService.artifacts[i].sala == "Sala 2") {
        index2.add(i);
        totalRegistros2 = totalRegistros2 + 1;
      }
    }

    return Column(
      children: [
        //Construccion de sala 1
        Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          height: 300,
          //color: Colors.black12,

          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              //el texto debe venir de la base de datos, CREAR OTRA CLASE QUE LEA Y ASIGNE EL NOMBRE DESDE LA BD
              child: Text(
                'Sala 1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: totalRegistros1,
                itemBuilder: (_, int index) {
                  return RoomsSlider(
                    artefacto: artifactService.artifacts[index1[index]],
                  );
                },
              ),
            ),
          ]),
        ),

        //Construccion de SALA 2
        Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          height: 300,
          //color: Colors.black12,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              //el texto debe venir de la base de datos, CREAR OTRA CLASE QUE LEA Y ASIGNE EL NOMBRE DESDE LA BD
              child: Text(
                'Sala 2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: totalRegistros2,
                itemBuilder: (_, int index) {
                  return RoomsSlider(
                    artefacto: artifactService.artifacts[index2[index]],
                  ); //titulo: artefacto.titulo[index]);
                },
              ),
            ),
          ]),
        )
      ],
    );
  }
}
