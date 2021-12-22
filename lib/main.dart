import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'commons/models/provider_model.dart';
import 'dachyak_enter_point.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ProviderModel(), child: Dachnyak()));
}
