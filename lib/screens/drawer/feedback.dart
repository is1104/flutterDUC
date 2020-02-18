import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/homepage.dart';
import 'package:flutter_app/services/auth.dart';

class FeedBack extends StatefulWidget {
  
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  AuthService _auth = AuthService();
  _FeedBackState();
  final _formKey1 = GlobalKey<FormState>();
  String about = '';
  String title = '';
  String message = '';
   String pf = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'How Can We Improve?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          FlatButton.icon(
            label: Text('Home'),
            icon: Container(
                width: 30, child: Image.asset('assets/images/Logo.png')),
            onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
          ),
        ],
        flexibleSpace: Container(
          decoration: new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
        ),
      ),
      //Form
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 160, 50, 80),
                child: Material(
                  elevation: 10,
                  color: Colors.white,
                  child: Center(
                    child: Form(
                      key: _formKey1,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5),
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Thoughts about the site',
                                  fillColor: Colors.white,
                                  filled: true, 
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    about = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 50),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Title',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  title = value;
                                });
                              },
                            ),
                            SizedBox(height: 50),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Message',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  message = value;
                                });
                              },
                            ),
                            SizedBox(height: 50),
                            RaisedButton(
                              color: Colors.blue[900],
                              child: Text('SUBMIT',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () async {
                               dynamic result =
                                      await _auth.feedBack(a: about,b: title,c: message);

                                      if (result != null) {
                                    setState(() =>
                                        pf = 'submited');
                                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Home()));
                                  }
                              },
                            ),
                            SizedBox(
                              height: 5
                            ),
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
