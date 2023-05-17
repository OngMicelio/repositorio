import 'package:app_museo_1/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final publicationService = Provider.of<PublicationService>(context);

    final size = MediaQuery.of(context).size;

    int totalRegistros = publicationService.publication.length;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.9,
          color: Colors.black26,
          child: Swiper(
            itemCount: totalRegistros,
            layout: SwiperLayout.STACK,
            autoplay: true,
            autoplayDelay: 5000,
            itemWidth: size.width * 0.7,
            itemHeight: size.height * 0.8,
            itemBuilder: (_, int index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'readp',
                    arguments: publicationService.publication[index]),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _CardSwiperImagen(
                        publication: publicationService.publication[index],
                      ),
                    ),
                    _CardSwiperTexto(
                        publication: publicationService.publication[index])
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CardSwiperImagen extends StatelessWidget {
  final Publication publication;

  const _CardSwiperImagen({super.key, required this.publication});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: 290,
      placeholder: AssetImage('assets/no-image.jpg'),
      image: NetworkImage(publication.imagen),
      fit: BoxFit.cover,
    );
  }
}

class _CardSwiperTexto extends StatelessWidget {
  final Publication publication;

  const _CardSwiperTexto({super.key, required this.publication});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 290,
        color: Colors.blueGrey,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Text(publication.titulo,
                style: textTheme.headline4,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            SizedBox(height: 5),
            Text(publication.descripcion,
                overflow: TextOverflow.ellipsis, maxLines: 7),
          ],
        ),
      ),
    );
  }
}
