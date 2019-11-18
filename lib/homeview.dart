import 'package:flutter/material.dart';
import 'package:flutter_app/army.dart';
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
    'assets/images/bikku.jpeg',
    'assets/images/elder.jpeg',
    'assets/images/children.jpeg',
    'assets/images/army.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: new ListView.builder(
            itemCount: homeNames.length,
            itemBuilder: (BuildContext context, int index) =>
                buildHomeCard(context, index)));
  }


  Widget buildHomeCard(BuildContext context, int index) {
    
   return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: new RaisedButton(
        onPressed: () {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Bikku()),
            );
          }
          else if (index==1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Elder()),
            );
          } else if (index==2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Children()),
            );
          }
          else{
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArmyCardPage()),
            );
          }
          
          
        },
        child: new Card(
          child: Container(
            width: double.infinity,
            height: 250,
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
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}