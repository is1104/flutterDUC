import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/bikku.dart';
import 'package:flutter_app/screens/home/homepage.dart';
import 'package:flutter_app/screens/webview.dart';
import 'package:url_launcher/url_launcher.dart';

// test git
class ElderPage extends StatelessWidget {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('permenantHomes')
        .where('homeType', isEqualTo: 'Elders` Home')
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                });
          }),
          title: Center(
            child: Text(
              'Elder Homes',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
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
        body: Container(
          child: FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading....."),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Material(
                          elevation: 10,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/nice.jpg"),
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            height: 300,
                            width: 100,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Material(
                                        elevation: 10, child: Icon(Icons.home)),
                                    title: Text(
                                        snapshot.data[index].data['homeName']),
                                    trailing: Text('Number of People: ' +
                                        snapshot
                                            .data[index].data['noOfChildren']),
                                    subtitle: Text('About Home: ' +
                                        snapshot.data[index].data['aboutHome']),
                                  ),
                                  // SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: <Widget>[
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Webview()));
                                            },
                                            child: Text(
                                              'View Calender',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: RaisedButton(
                                        onPressed: () {
                                          
                                          launch("tel://0779265695");
                                        },
                                        child: Material(
                                          child: Icon(Icons.call),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Webview()));
                                        },
                                        child: Text(
                                          'Make Donation',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal),
                                          textAlign: TextAlign.center,
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
                    );
                  }, //title: Text(snapshot.data[index].data['h_name']),
                );
                
              }
            },
          ),
        ));
  }
}
