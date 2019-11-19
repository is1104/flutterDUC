import 'package:flutter/material.dart';

class CustomInputFieldPass extends StatelessWidget {
  String password;
  final Icon fieldIcon;
  final String hintText;
  static final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  CustomInputFieldPass(this.fieldIcon, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fieldIcon,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                width: 200,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey2,
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return ('email or password missing');
                        }
                      },
                      onSaved: (input) => password = input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        fillColor: Colors.white,
                      ),
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      obscureText: true,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
