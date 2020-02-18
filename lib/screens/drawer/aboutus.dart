import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/webview.dart';

import '../webviewfb.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/face.jfif'),
           onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebviewFb()),
                  );
                }
          ),
        ],
        flexibleSpace: Container(
          decoration: new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Container(
                child: CarouselSlider(
                  autoPlay: true,
                  height: 150.0,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  pauseAutoPlayOnTouch: Duration(seconds: 3),
                  items: [
                    'assets/images/dasith.jpg',
                    'assets/images/nirmani.jpg',
                    'assets/images/hansika.jpg',
                    'assets/images/induwara.jpg',
                    'assets/images/group.jpeg',
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            child: Card(
                              child: Container(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '\tWe are a group of 4,who are still studying in UCSC.\n' +
                              'As our second year group project we have been planning to create a platform connecting all the potential homes (Childrens, Elders, Soldier ailing & Bikkhu ailing) and Cancer Hospital as well. This is going to be a system where donors and the people who are in need of helpful hands can meet each other. Until we completely develop the system, we intended to use this page to share their needs with you.\n' +'\n'+
                              'fhfjefefhehfuefhjfwefuhefhfeiyfgbhefbvcefvfsdgsgsgdgse\n' + 'dekfbwekhbfbskevjdbv\n' + '\n\n' + 'Contact Us\n\n\b'+'Dasith Devapriya\ndasith84@gmail.com\ntel:0774683634\n\nInduwara Jayalath\ninduwara@gmail.com\ntel:07741586329\n\nHansika Muthunayake\nhansika@gmail.com\ntel:0774157896324\n\nNirmani Wimalasooriya\nnirmani@gmail.com\ntel:0771235698745'),
                    ),
                  ),
                      Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '\tWe are a group of 4,who are still studying in UCSC.\n' +
                          'sbsgisghafnascbwidwjdnahdbeaidhacj ashcdshvbefacj acha dbaedbw\n' +'\n'+
                          'fhfjefefhehfuefhjfwefuhefhfeiyfgbhefbvcefv\n' + 'dekfbwekhbfbskevjdbv\n' + '\n\n' + '\n\n\b'),
                ),
              ),
                   Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Dasith Devapriya\n tel:0774683634 \n'),
                ),
                
              ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
