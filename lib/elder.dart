import 'package:flutter/material.dart';
import 'package:flutter_app/elderinfo.dart';

class Elder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ELDER HOMES',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/Logo.png'),
              onPressed: null,
            ),
          ],
          flexibleSpace: Container(
            decoration:
                new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
          ),
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              width: double.infinity,
              height: 350,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/elder.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: new RaisedButton(
                child: new Text("More Info"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ElderPage()),
                  );
                },
              ),
            ),
          ],
        ),
        
        );
  }
}
