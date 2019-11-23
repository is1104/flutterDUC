import 'package:flutter/material.dart';
import 'package:flutter_app/army.dart';
import 'login/loginview.dart';
import './bikku.dart';
import './army.dart';
import './children.dart';
import './elder.dart';

class HomeView extends StatelessWidget {
  final List<String> homeNames = [
    'Bikku Homes',
    'Elder Homes',
    'Children Homes',
    'Army Camps'
  ];
  final List<String> images = [
    'assets/images/bikku.png',
    'assets/images/elder.png',
    'assets/images/children.png',
    'assets/images/army.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 7,
        color: Colors.white,
        child: new ListView.builder(
            itemCount: homeNames.length,
            itemBuilder: (BuildContext context, int index) =>
                buildHomeCard(context, index)));
  }

  Widget buildHomeCard(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: new RaisedButton(
            onPressed: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bikku()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Elder()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Children()),
                );
              } else  {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmyCardPage()),
                );
              } 
            },
            
            child: new Card(
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  homeNames[index],
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  
}
