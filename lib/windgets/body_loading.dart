import 'package:flutter/material.dart';

class BodyLoading extends StatefulWidget {
  const BodyLoading({super.key});

  @override
  State<BodyLoading> createState() => _BodyLoadingState();
}

class _BodyLoadingState extends State<BodyLoading> {
  double opacityLevel = 0.0;
  double opacityLevel2 = 0.0;
  double opacityLevel3 = 0.0;

  void _changeOpacity(int opt) {
    //metodo modifica valores de variables opacidad
    switch (opt) {
      case 1:
        setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
        break;
      case 2:
        setState(() => opacityLevel2 = opacityLevel2 == 0 ? 1.0 : 0.0);
        break;
      case 3:
        setState(() => opacityLevel3 = opacityLevel3 == 0 ? 1.0 : 0.0);
        break;
    }
  }

  void controls(int opt) {
    //metodo para indicar el inicio de la animacion de los objetos
    int _time = 0;
    int _opt = 1;
    switch (opt) {
      case 1:
        _time = 1500;
        _opt = 1;
        break;

      case 2:
        _time = 2500;
        _opt = 2;
        break;

      case 3:
        _time = 3500;
        _opt = 3;
        break;
    }

    Future.delayed(
      Duration(milliseconds: _time),
      () => _changeOpacity(_opt),
    );
  }

  @override
  void initState() {
    controls(1);
    controls(2);
    controls(3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      //Imagen de fondo
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/loadback.png'), fit: BoxFit.cover),
      ),
      child: Column(children: [
        SizedBox(height: size.height * 0.30),

        //contenedor de todo el contenido del body
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 2),
          child: Container(
            height: size.height * 0.15,
            width: size.width * 0.35,
            alignment: Alignment.topCenter,
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Image(image: AssetImage('assets/museo.png'), fit: BoxFit.fill),
              Image(image: AssetImage('assets/borde.png'), fit: BoxFit.fill),
            ]),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        //Texto logo
        AnimatedOpacity(
          opacity: opacityLevel2,
          //opacity: 1.0,
          duration: Duration(seconds: 5),
          child: Container(
            height: size.height * 0.07,
            width: size.width * 0.40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/texto.png'), fit: BoxFit.fill),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        AnimatedOpacity(
            opacity: opacityLevel3,
            duration: Duration(seconds: 5),
            child:
                Center(child: CircularProgressIndicator(color: Colors.indigo))),
      ]),
    );
  }
}
