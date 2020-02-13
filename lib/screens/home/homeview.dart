import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/army.dart';
import 'package:flutter_app/bikku.dart';
import 'package:flutter_app/children.dart';
import 'package:flutter_app/elder.dart';
import 'package:flutter_app/screens/home/userinfo.dart';
import 'package:flutter_app/specialevent.dart';

class HomeView extends StatelessWidget {
  final List<String> homeNames = [
    'Bikku Homes',
    'Elder Homes',
    'Children Homes',
    'Solider Homes'
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
     int _current = 0;

    return Material(
      elevation: 50,
      child: Column(
        children: <Widget>[
          if (index == 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                autoPlay: true,
                height: 100.0,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                pauseAutoPlayOnTouch: Duration(seconds: 3),
                items: [
                  'assets/images/don.jpg',
                  'assets/images/lh.png',
                  'assets/images/1234.png',
                  'assets/images/blood.png'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: FlatButton(
                          onPressed: (){
                             Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpecialEvent()),
                    );
                          },
                          child: Card(
                            child : Container(
                               width: double.infinity,
                              height: 150,
                           // width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 0.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(i),
                                  fit: BoxFit.fill,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              child: Text(
                                'Special Events',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            
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
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Army()),
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
          UserIn(),
        ],
      ),
    );
  }
}
