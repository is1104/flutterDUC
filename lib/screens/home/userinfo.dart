import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/userinfomodel.dart';

class UserIn extends StatefulWidget {
  @override
  _UserInState createState() => _UserInState();
}

class _UserInState extends State<UserIn> {
  @override
  Widget build(BuildContext context) {

    final userDetail = Provider.of<List<Info>>(context);
    userDetail.forEach((a){
       print(a.fname);
    });
    return Container(
      
    );
  }
}