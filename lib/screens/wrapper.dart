import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/authentication/signin.dart';
import 'package:flutter_app/screens/authentication/authenticate.dart';
import 'package:flutter_app/screens/home/homepage.dart';
import 'package:flutter_app/screens/home/homeview.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home or authenticate
    if (user == null) {
      return Authenticate();
    }else{
      return Home();
    }
  }
}