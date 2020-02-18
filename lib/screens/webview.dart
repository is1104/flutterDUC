
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/homepage.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => new _WebviewState();
}

class _WebviewState extends State<Webview> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InAppWebViewPage()
    );
  }
}

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  InAppWebViewController webView;

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
              'DO YOUR CHARITY',
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
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  child: InAppWebView(
                    initialUrl: "https://zodductest.firebaseapp.com/#/login",
                    initialHeaders: {},
                    initialOptions: InAppWebViewWidgetOptions(
                      inAppWebViewOptions: InAppWebViewOptions(
                        debuggingEnabled: true,
                      ),
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {

                    },
                    onLoadStop: (InAppWebViewController controller, String url) {

                    },
                  ),
                ),
              ),
            ]))
    );
  }
}