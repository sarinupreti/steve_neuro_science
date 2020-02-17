import 'package:flutter/material.dart';
import 'package:steve_beaudoin/routes/routes.dart';
import 'package:steve_beaudoin/screens/home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      onGenerateRoute: AppRoutes().routes,
    );
  }
}
