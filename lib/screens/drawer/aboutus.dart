import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
            icon: Image.asset('assets/images/Logo.png'),
            onPressed: null,
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
                  height: 200.0,
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
                              'sbsgisghafnascbwidwjdnahdbeaidhacj ashcdshvbefacj acha dbaedbw\n' +'\n'+
                              'fhfjefefhehfuefhjfwefuhefhfeiyfgbhefbvcefvfsdgsgsgdgse\n' + 'dekfbwekhbfbskevjdbv\n' + '\n\n' + 'Contact Us\n\n\b'),
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
