import 'package:app_museo_1/windgets/widgets.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(height: 300),
        const Center(child: ScanBotton()),
      ],
    );
  }
}
