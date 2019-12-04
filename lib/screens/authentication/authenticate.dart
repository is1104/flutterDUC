import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authentication/signin.dart';
import 'package:flutter_app/screens/authentication/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
   bool showSignIn = true;
    void toggelView(){
      setState(() =>
        showSignIn = ! showSignIn
      );
    }
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggelView:toggelView);
    }else{
      return SignUp(toggelView:toggelView);
    }
  }
}