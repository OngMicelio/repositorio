import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class Customnavigatorbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leer_seleccion = Provider.of<UIProvider>(context);
    final indice = leer_seleccion.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => leer_seleccion.selectedMenuOpt = i,

      /* PROPIEDADES PERSONALIZAR BOTTONNAVIGATIONBAR
      
      currentIndex: indice,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.pink,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      */
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Inicio',
            backgroundColor: Colors.white30),
        //backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.map
            , size: 30),
            label: 'Salas',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, size: 30),
            label: 'Escanear',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_edu, size: 30),
            label: 'Publicaciones',
            backgroundColor: Colors.blue
            //backgroundColor: Colors.indigo),
            ),
      ],
    );
  }
}
