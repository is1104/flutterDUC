import 'package:flutter/material.dart';
import 'package:flutter_app/login/login.dart';
import './login.dart';
import './password.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Material(
                color: Colors.white,
                child: Container(
                  width: 600,
                  height: 400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 75, 20, 10),
              child: Material(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    color: Colors.white,
                    width: 400,
                    height: 620,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                            elevation: 10.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: Image.asset(
                                'assets/images/Logo.png',
                                width: 80,
                                height: 80,
                              ),
                            )),
                        CustomInputFieldEmail(
                          Icon(Icons.person, color: Colors.white),
                          'Username',
                        ),
                        CustomInputFieldPass(
                            Icon(Icons.lock, color: Colors.white), 'Password'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                          child: Container(
                            width: 150,
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
