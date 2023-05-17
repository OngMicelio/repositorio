import 'package:app_museo_1/models/models.dart';
import 'package:app_museo_1/windgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReadPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Publication publicacion =
        ModalRoute.of(context)!.settings.arguments as Publication;

    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppBar(artefacto: publicacion),
        SliverList(
            delegate: SliverChildListDelegate([
          _VideoObjet(artefacto: publicacion),
          _ImageAndTitle(artefacto: publicacion),
          _TextObjet(artefacto: publicacion),
          LinkCards()
        ])),
      ]),
    );
  }
}

//baner superior personalizado
class _CustomAppBar extends StatelessWidget {
  final Publication artefacto;

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
  final Publication artefacto;

  const _ImageAndTitle({super.key, required this.artefacto});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        /* ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
              height: 150,
              width: 110,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(artefacto.imagen)),
        ),
 
        SizedBox(width: 20), //espacio entre el titulo y lo que sigue
        */

        //subtitulo, sala, antiguedad
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 60),
          child: Container(
            //color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(artefacto.subtitulo,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                /*  Text(artefacto.fecha,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2), */
                Row(
                  children: [
                    Icon(Icons.book, size: 15, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(artefacto.fecha)
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class _VideoObjet extends StatefulWidget {
  final Publication artefacto;

  const _VideoObjet({super.key, required this.artefacto});

  @override
  State<_VideoObjet> createState() => _VideoObjetState();
}

class _VideoObjetState extends State<_VideoObjet> {
  final videoURL = "https://www.youtube.com/watch?v=vZAtpb_nGLg&t=9s";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ],
      ),
    );
  }
}

class _TextObjet extends StatelessWidget {
  final Publication artefacto;
  const _TextObjet({super.key, required this.artefacto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Text(
            artefacto.descripcion,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
