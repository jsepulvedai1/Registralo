import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ComoFunciona extends StatefulWidget{

  @override
  _ComoFuncionaState createState() => _ComoFuncionaState();
}

class _ComoFuncionaState extends State<ComoFunciona> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Como Funciona")),
      body: Center(
        child: Text("Como Funciona",
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)
        )),
    ) ;
  }
}