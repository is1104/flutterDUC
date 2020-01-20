import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/bikku.dart';
import 'package:flutter_app/screens/home/homepage.dart';

// test git
class ArmyPage extends StatelessWidget {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('permenantHomes')
        .where('homeType', isEqualTo: 'Soldier Home')
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
              'Solider Homes',
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
                            height: 120,
                            width: 100,
                            child: ListTile(
                              leading: Material(
                                  elevation: 10, child: Icon(Icons.home)),
                              title: Text(snapshot.data[index].data['homeName']),
                              trailing: Text('Number of People: ' +
                                  snapshot.data[index].data['noOfChildren']),
                              subtitle: Text('About Home: ' +
                                  snapshot.data[index].data['aboutHome']),
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
