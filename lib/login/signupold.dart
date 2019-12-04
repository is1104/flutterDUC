/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/authentication.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'LOGIN ',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Logo.png'),
            onPressed: null,
          ),
        ],
        flexibleSpace: Container(
          decoration: new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          width: double.infinity,
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(width: 20, height: 20),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'enter a email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  validator: (value) =>
                      value.length < 6 ? 'password not valid' : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Loginn', style: TextStyle(color: Colors.black)),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
                      if (result == null) {
                        setState(() => error = 'could not sign in with credentials');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/