import 'package:flutter/material.dart';

class Cardlist extends StatelessWidget {
  Cardlist({this.data, this.defualtvalue, this.name});

  final String? data;
  final String? defualtvalue;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lime.shade200,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $name = $data $defualtvalue',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
