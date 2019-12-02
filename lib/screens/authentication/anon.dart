import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/homeview.dart';
import 'package:flutter_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.red ,
         elevation: 0.0,
         title: Text('SignIn'),
       ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: RaisedButton(
          child: Text('SignIn'),
          onPressed: ()async{
            dynamic result =await _auth.signInAnon();
            if (result == null) {
              print('error signing in');
            }else{
              print('signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
