import 'package:flutter/material.dart';

class CardStyle extends StatelessWidget {
  final String cardName;
  CardStyle(this.cardName);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        cardName,
        style: TextStyle(fontSize: 28, color: Colors.blue),
        textAlign: TextAlign.left,
      ),
    );
    
  }
}
