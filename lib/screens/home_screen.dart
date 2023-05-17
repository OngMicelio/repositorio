import 'dart:ffi';

import 'package:app_museo_1/providers/ui_provider.dart';
import 'package:app_museo_1/screens/screens.dart';
import 'package:app_museo_1/windgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //traslado estas lineas a la interfaz de los artefactos
    final artifactService = Provider.of<ArtifactService>(context);

    if (artifactService.isLoading) return LoadingScreen();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 15, 8),
      body: Column(
        children: [_HomePageBody(), Customnavigatorbar()],
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override //se lee la opcion del menu y con eso se consutrye la paguna
  Widget build(BuildContext context) {
    final leerseleccion = Provider.of<UIProvider>(context);
    final indice = leerseleccion.selectedMenuOpt;

    return _BuilderPage(opt: indice);
    //return CardTable();
  }
}

class _BuilderPage extends StatelessWidget {
  final int opt;
  const _BuilderPage({super.key, required this.opt});

  @override
  Widget build(BuildContext context) {
    switch (opt) {
      case 0:
        return Stack(
            children: [_Backgrounhead(opt: 0), _BackgroundBody(), ListHome()]);
        break;

      case 1:
        return Stack(children: [_Backgrounhead(opt: 1), MapScreen()]);
        break;

      case 2:
        return Stack(children: [
          _Backgrounhead(opt: 2),
          _BackgroundBody(),
          ScanScreen()
        ]);
        break;

      case 3:
        return Stack(children: [
          _Backgrounhead(opt: 3),
          _BackgroundBody(),
          PublicationScreen()
        ]);
        break;

      default:
        return Stack(children: [_Backgrounhead(opt: 0), ListHome()]);
        break;
    }
  }
}

class _Backgrounhead extends StatelessWidget {
  final int opt;

  const _Backgrounhead({super.key, required this.opt});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String _image = 'assets/00.jpg';
    double _heigth = size.height * 0.35;

    switch (opt) {
      case 0:
        _image = 'assets/00.jpg';
        _heigth = size.height * 0.35;
        break;
      case 1:
        _image = 'assets/accediendo_1.gif';
        _heigth = size.height * 0.90;
        break;
      case 2:
        _image = 'assets/frontal_noche3x4.jpg';
        _heigth = size.height * 0.35;
        break;
      case 3:
        _image = 'assets/frontal_dia.jpg';
        _heigth = size.height * 0.35;
        break;

      default:
        _image = 'assets/no-image.jpg';
        _heigth = size.height * 0.35;
        break;
    }
    return Container(
      // color: Colors.yellow,
      alignment: Alignment.topCenter,
      child: Image(
        image: AssetImage(_image),
        fit: BoxFit.cover,
        height: _heigth,
        width: size.width,
      ),
    );
  }
}

class _BackgroundBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: size.height * 0.25),
      Center(
        child: Container(
          height: size.height * 0.65,
          width: double.infinity,
          child: Image(
              image: AssetImage('assets/backimage.png'), fit: BoxFit.fill),
        ),
      )
    ]);
  }
}
