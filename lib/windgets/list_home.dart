import 'dart:ui';

import 'package:app_museo_1/screens/screens.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class ListHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final leer_seleccion = Provider.of<UIProvider>(context);
    final indice = leer_seleccion.selectedMenuOpt;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.35,
        ),
        Container(
            width: double.infinity,
            height: size.height * 0.55,
            color: Colors.black54,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Swiper(
                itemCount: 4,
                layout: SwiperLayout.DEFAULT,
                autoplay: true,
                autoplayDelay: 5000,
                itemWidth: size.width * 0.20,
                itemHeight: size.height * 0.55,
                control: SwiperPagination(),
                itemBuilder: (_, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: _Contenido(
                      id: 0,
                    ),
                    // Image(
                    //     image: NetworkImage(
                    //         'https://via.placeholder.com/300x300')),
                  );
                })),
      ],
    );
  }
}

class _Item1 extends StatelessWidget {
  final size;
  const _Item1({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Colors.red,
    );

    /*  Container(
        width: double.infinity,
        height: size.height * 0.55,
        color: Colors.black54,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Swiper(
            itemCount: 4,
            layout: SwiperLayout.DEFAULT,
            autoplay: true,
            autoplayDelay: 5000,
            itemWidth: size.width * 0.20,
            itemHeight: size.height * 0.55,
            control: SwiperPagination(),
            itemBuilder: (_, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _Contenido(
                  id: 0,
                ),
                // Image(
                //     image: NetworkImage(
                //         'https://via.placeholder.com/300x300')),
              );
            })); */
  }
}

class _Contenido extends StatelessWidget {
  final int id;
  const _Contenido({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          "Bienvenido a Museo Lircunlauta",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Text(
          "La Casa Patronal del Fundo de Lircunlauta (o de Nilcunlauta)es un antigua casa patronal ubicada en la ciudad chilena de San Fernando, provincia de Colchagua. Fue declarado monumento histórico nacional por el Consejo de Monumentos Nacionales el año 1981 mediante el Decreto N° 71. Actualmente, el sector sur de la construcción, alberga a la Ilustre Municipalidad de San Fernando y al Museo de Lircunlauta.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
