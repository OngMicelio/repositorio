import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';

class RoomsSlider extends StatelessWidget {
  final Artifact artefacto;

  const RoomsSlider({Key? key, required this.artefacto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 150,
        height: 210,
        color: Color.fromARGB(255, 8, 75, 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          GestureDetector(
            //envia hacia la pagina de lectura del objeto
            onTap: () =>
                Navigator.pushNamed(context, 'detail', arguments: artefacto),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(artefacto.imagen),
                width: 150,
                height: 210,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            artefacto.titulo,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            //style: textTheme.headline6,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        ]),
      ),
    );
  }
}
