import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConsultaBien extends StatefulWidget{

  @override
  _ConsultaBienState createState() => _ConsultaBienState();
}

class _ConsultaBienState extends State<ConsultaBien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consulta Bien")),
      body: Center(
        child: Text("Consulta Bien",
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)
        )),
    ) ;
  }
}