import 'package:flutter/material.dart';

class MisBienes  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(140, 208, 242, 1),
   
      appBar: AppBar(
  
          flexibleSpace: Image(
          image: AssetImage('assets/misbienes.png'), 
          fit: BoxFit.cover,
          ),
          backgroundColor: Color.fromRGBO(140, 208, 242, 1),

        
      ),
      body: Container(   
        
        child: Column(
          children: <Widget>[
         
          ],) ,
          )
    );
 
  }

}