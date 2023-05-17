import 'package:app_museo_1/models/artifact.dart';
import 'package:app_museo_1/windgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Artifact artefacto =
        ModalRoute.of(context)!.settings.arguments as Artifact;

    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppBar(artefacto: artefacto),
        SliverList(
            delegate: SliverChildListDelegate([
          _ImageAndTitle(artefacto: artefacto),
          _TextObjet(artefacto: artefacto),
          _TextObjet(artefacto: artefacto),
          _TextObjet(artefacto: artefacto),
          _TextObjet(artefacto: artefacto),
          LinkCards()
        ])),
      ]),
    );
  }
}

//baner superior personalizado
class _CustomAppBar extends StatelessWidget {
  final Artifact artefacto;

  const _CustomAppBar({super.key, required this.artefacto});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            artefacto.titulo,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ), //reemplazar por valor leido de la BD
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(artefacto.imagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//imagen y titulo del objeto
class _ImageAndTitle extends StatelessWidget {
  final Artifact artefacto;

  const _ImageAndTitle({super.key, required this.artefacto});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
              height: 150,
              width: 110,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(artefacto.imagen)),
        ),

        SizedBox(width: 20), //espacio entre el titulo y lo que sigue

        //subtitulo, sala, antiguedad
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(artefacto.nombre,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Text(artefacto.sala,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Row(
                children: [
                  Icon(Icons.book, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(artefacto.fecha)
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _TextObjet extends StatelessWidget {
  final Artifact artefacto;

  const _TextObjet({super.key, required this.artefacto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        artefacto.descripcion,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
