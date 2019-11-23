import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// test git
class BikkuPage extends StatelessWidget {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('permenantHomes').where('homeType',isEqualTo: 'Soldier Home').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(icon: Icon(Icons.menu), onPressed: null);
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
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.home),
                        title: Text(snapshot.data[index].data['homeName']),
                        subtitle: Text('Number of People: '+snapshot.data[index].data['homeType']),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    );
                  }, //title: Text(snapshot.data[index].data['h_name']),
                );
              }
            },
          ),
        ));
        Container(width:300,height: 300,
        child:RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },)
        );
  }
}