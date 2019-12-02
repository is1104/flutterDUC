import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/home/homepage.dart';
import 'package:flutter_app/screens/home/homeview.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';
void main() => runApp(DucApp());

class DucApp extends StatefulWidget {
  @override
  _DucAppState createState() => _DucAppState();
}

class _DucAppState extends State<DucApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home:Wrapper(),
      ),
    );
  }
}
