import 'package:flutter/material.dart';
import './homepage.dart';

void main() => runApp(DucApp());

class DucApp extends StatefulWidget {
  @override
  _DucAppState createState() => _DucAppState();
}

class _DucAppState extends State<DucApp> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
