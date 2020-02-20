import 'package:flutter/material.dart';
import 'package:steve_beaudoin/components/hive.dart';
import 'package:steve_beaudoin/index.dart';

Future<void> main() async {
  //If you're running an application and need to access the binary messenger before `runApp()` has been called (for example, during plugin initialization), then you need to explicitly call the `WidgetsFlutterBinding.ensureInitialized()` first.
  WidgetsFlutterBinding.ensureInitialized();
  // Hive setup
  await HiveSetup.initHive;
  runApp(MyHomePage());
}
