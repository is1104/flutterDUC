import 'package:flutter/material.dart';
import 'package:flutter_app/army.dart';
import './homeview.dart';
import 'package:flutter_app/services/auth.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  AuthService _auth = AuthService();
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              onPressed: () async{
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
                  accountName: new Text('Dasith Devapriya'),
                  accountEmail: new Text('dasith84@gmail.com'),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        'https://vancityblog.azureedge.net/wp-content/uploads/2016/12/GiveHands-iStock-Blog-1280x620-1280x620.jpg'),
                  )),
                ),
                new ListTile(
                  title: new Text('HOME'),
                  trailing: Icon(Icons.home),
                ),
                new ListTile(
                  title: new Text('New Donation'),
                  trailing: Icon(Icons.arrow_drop_down),
                ),
                new ListTile(
                  title: new Text('Pending Donation'),
                  trailing: Icon(Icons.watch),
                ),
                new ListTile(
                  title: new Text('Past Donation'),
                  trailing: Icon(Icons.calendar_today),
                ),
                SizedBox(
                  height: 10,
                ),
                new ListTile(
                  title: new Text('login'),
                  trailing: Icon(Icons.person),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ArmyCardPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: HomeView(),
      ),
    );
  }
}
