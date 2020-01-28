import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Contacto extends StatefulWidget{

  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacto")),
      body: Center(
        child: Text("Contacto",
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)
        )),
    ) ;
  }
}