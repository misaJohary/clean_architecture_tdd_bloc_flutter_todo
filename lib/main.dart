import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency_injection.dart';

void main() async {
  await init();
  runApp(const App());
}
