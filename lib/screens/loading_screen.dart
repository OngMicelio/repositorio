import 'dart:async';

import 'package:app_museo_1/windgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    /*() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final artifactService = Provider.of<ArtifactService>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(body: BodyLoading());
  }
}
