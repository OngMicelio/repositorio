import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class ScanBotton extends StatelessWidget {
  const ScanBotton({super.key});

  @override
  Widget build(BuildContext context) {
    final artifactService = Provider.of<ArtifactService>(context);

    return FloatingActionButton.large(
        elevation: 0,
        child: const Icon(Icons.filter_center_focus, size: 50),
        onPressed: () async {
          /*String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);*/
          final barcodeScanRes = 'ABC119';
          try {
            int index = artifactService.artifacts
                .indexWhere((element) => element.id == barcodeScanRes);
            final artefacto = artifactService.artifacts[index];
            Navigator.pushNamed(context, 'detail', arguments: artefacto);
          } catch (e) {
            print("Resultado no existe en base de datos $e");
          }
        });
  }
}
