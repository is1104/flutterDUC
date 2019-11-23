import 'package:flutter/material.dart';
import 'package:flutter_app/login/loginview.dart';
import './homeview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'DO YOUR CHARITY',
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
                        builder: (BuildContext context) => LogIn()));
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
