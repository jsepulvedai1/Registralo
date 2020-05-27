import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:splashscreen/splashscreen.dart';
// import 'package:Registralo/src/pages/basico_page.dart';
// import 'package:Registralo/src/pages/scroll_page.dart';

import 'package:Registralo/src/pages/utils/flutkart.dart';
import 'package:splashscreen/splashscreen.dart';


class MyApp1 extends StatefulWidget {
  @override
  _MyApp1 createState() => _MyApp1();
}
class  _MyApp1 extends State<MyApp1> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () =>Navigator.pushReplacementNamed(context, "botones"));
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      flexibleSpace: Image(
          image: AssetImage('assets/appbar2.png'), 
          fit: BoxFit.cover
        ),
        backgroundColor: Color.fromRGBO(33, 150, 243, 1.0),
       ),
      body: Stack(
       
        fit: StackFit.expand,
        children: <Widget>[
          _fondoApp(),
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.inbox,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        Flutkart.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(backgroundColor: Colors.white ,),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      Flutkart.store,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
   Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(120, 200, 240, 1.0),
            Color.fromRGBO(120, 200, 240, 1.0)
          ]
        )
      ),
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
    );
    
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa
        )
      ],
    );
  }
}
