import 'package:flutter/material.dart';
import 'package:flutter_uas/home.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
void main() => runApp(Main());
