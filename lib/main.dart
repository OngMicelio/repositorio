import 'package:app_museo_1/providers/ui_provider.dart';
import 'package:app_museo_1/screens/screens.dart';
import 'package:app_museo_1/services/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ArtifactService(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UIProvider()),
        ChangeNotifierProvider(create: (_) => ArtifactService()),
        ChangeNotifierProvider(create: (_) => PublicationService()),
        ChangeNotifierProvider(create: (_) => RoomsService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Museo Casa Lircunlauta',
          //initialRoute: 'home',
          initialRoute: 'home',
          routes: {
            'home': (_) => HomeScreen(),
            'detail': (_) => DetailScreen(),
            'readp': (_) => ReadPScreen(),
            'rooms': (_) => RoomsScreen(),
            'scans': (_) => ScanScreen(),
            'publications': (_) => PublicationScreen(),
            'load': (_) => LoadingScreen()
          },
          theme: ThemeData.light()),
    );
  }
}
