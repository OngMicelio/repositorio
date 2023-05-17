import 'package:app_museo_1/models/models.dart';
import 'package:flutter/material.dart';

class ArtifactFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Artifact artifact;

  ArtifactFormProvider(this.artifact);

  /*
  updateAvailability( bool value ) {
    print(value);
    this.artifact.available = value;
    notifyListeners();
  }
  */

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
