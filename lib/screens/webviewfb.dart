import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'home/homepage.dart';


class WebviewFb extends StatefulWidget {
  @override
  _WebviewFbState createState() => _WebviewFbState();
}

class _WebviewFbState extends State<WebviewFb> {
  Completer<WebViewController> _controller = Completer<WebViewController>();


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
      body: WebView(
        initialUrl: 'https://www.facebook.com/DoUrCharity/?epa=SEARCH_BOX',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }


}
