import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/armyinfo.dart';
import './homeview.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/important/firestore.dart';
import 'package:flutter_app/models/userinfomodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  FirebaseUser mCurrentUser;
  String _uname = " ";
  AuthService _auth = AuthService();
  var firestore = Firestore.instance;
  final FirebaseAuth _auth1 = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    mCurrentUser = await _auth1.currentUser();
    DocumentSnapshot item = await Firestore.instance
        .collection("userDetails")
        .document(mCurrentUser.uid)
        .get();

    setState(() {
      _uname = item['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Info>>.value(
      value: FireStoreDb().userDetail,
      child: MaterialApp(
        home: Container(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'DO YOUR CHARITY',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Container(
                      width: 30, child: Image.asset('assets/images/Logo.png')),
                  label: Text('Log Out'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ],
              flexibleSpace: Container(
                decoration:
                    new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
              ),
            ),
            drawer: Builder(
              builder: (context) => new Drawer(
                child: new ListView(
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      accountName: new Text(
                        _uname,
                        style: TextStyle(color: Colors.black),
                      ),
                      accountEmail: new Text(
                        "${mCurrentUser?.email}",
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            'https://vancityblog.azureedge.net/wp-content/uploads/2016/12/GiveHands-iStock-Blog-1280x620-1280x620.jpg'),
                      )),
                    ),
                    new ListTile(
                      title: new Text('About Us'),
                      trailing: Icon(Icons.face),
                    ),
                    new ListTile(
                      title: new Text('Pending Donation'),
                      trailing: Icon(Icons.watch),
                    ),
                    new ListTile(
                      title: new Text('Feed Back'),
                      trailing: Icon(Icons.add_comment),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new ListTile(
                      title: new Text('Settings'),
                      trailing: Icon(Icons.settings),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ArmyPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: HomeView(),
          ),
        ),
      ),
    );
  }
}
