import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../windgets/widgets.dart';

class PublicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardSwiper(),
      // SizedBox(height: 15),
      //ContenidoSwiper()],
    );
  }
}
