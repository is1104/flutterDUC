import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/homeview.dart';
import 'package:flutter_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggelView;
  SignIn({this.toggelView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          FlatButton.icon(
            label: Text('SIGN UP'),
            icon: Container(
                width: 30, child: Image.asset('assets/images/Logo.png')),
            onPressed: () {
              widget.toggelView();
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
        ),
      ),
      //anonnymus sign in button
      /*Container(
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
      ),*/
      //Form
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 125),
                child: Material(
                  elevation: 10,
                  color: Colors.white,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                              width: double.infinity,
                            ),
                            Material(
                              elevation: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/Logo.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'email',
                                fillColor: Colors.grey,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0)),
                              ),
                              validator: (value) =>
                                  value.isEmpty ? 'Enter an email' : null,
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                              width: double.infinity,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'password',
                                fillColor: Colors.grey,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0)),
                              ),
                              validator: (value) => value.length < 8
                                  ? 'Password must be atleast 8 characters'
                                  : null,
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: RaisedButton(
                                color: Colors.blue[900],
                                child: Text('LOGIN',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                        await _auth.signInWithEmailandPassword(
                                            email, password);

                                    if (result == null) {
                                      setState(
                                          () => error = 'COULD NOT SIGNIN');
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
