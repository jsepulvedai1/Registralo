//No se esta usando, solo LoginForm

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Contacto extends StatefulWidget{

  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {

  final estiloTitulo    = TextStyle( color: Color.fromRGBO(255, 255, 0, 1),fontSize: 20.0, fontWeight: FontWeight.bold, backgroundColor: Color.fromRGBO(41, 51, 125, 1), );
  final _formKey = GlobalKey<FormState>();
  int selectedIndex1 = 0;

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(context),
            _crearTitulo(),
            _formulario(),
        
          ],
        ),
      )
    );
  }
  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, 'scroll'),
        child: 
        Image.asset('assets/contacto.png',height: 100.0, 
          fit: BoxFit.contain,),

        ),
      );
    
  }
  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
       
        color: Color.fromRGBO(0, 0, 255, 0),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
   
      ),
    );
  }

    Widget _formulario(){
      
      return Form(
      key: _formKey,
      child: Column(

        
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nombre',
              
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
          decoration: const InputDecoration(
            hintText: 'Rut',
            
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),

        TextFormField(
        decoration: const InputDecoration(
          hintText: 'Email',
          
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
          TextFormField(
          decoration: const InputDecoration(
            hintText: 'Reingresar email',
            
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
  
          TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(
            hintText: 'Mensaje',
          

            
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
  );
  }
}
