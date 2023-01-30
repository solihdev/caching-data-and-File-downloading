import 'package:cachingdata_and_filedownloading/app/app.dart';
import 'package:flutter/material.dart';
import 'utils/assistants/get_it/get_it.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
