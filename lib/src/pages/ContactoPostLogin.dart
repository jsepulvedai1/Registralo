import 'package:flutter/material.dart';

class ContactoPostLogin  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(140, 208, 242, 1),
   
      body: Container(   
        child: Column(
          children: <Widget>[
          _crearImagen(context),
          ],) ,
          )
    );
  }
    Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, 'scroll'),
        child: 
        Image.asset('assets/contactoPostLogin.png',height: 100.0, 
          fit: BoxFit.contain,),
        ),
      );
  }
}