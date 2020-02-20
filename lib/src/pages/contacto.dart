import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:disenos/src/pages/consultaBien.dart';
import 'package:disenos/src/pages/comoFunciona.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:math';


class Contacto extends StatefulWidget{

  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.home),
              onPressed: ()=> Navigator.pushNamed(context, 'botones'),
            ),
        ]
        ),
      body: 
      Stack(
        children: <Widget>[
         _fondoApp(),
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
            Color.fromRGBO(148, 196, 254, 1.0),
            Color.fromRGBO(0, 132, 170, 1.0)
          ]
        )
      ),
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      // child: Container(
      //   height: 360.0,
      //   width: 360.0,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(80.0),
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.blue[600],
      //       ]
      //     )
      //   ),
      // )
    );
    
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

  //   Widget _bottomNavigationBar(BuildContext context){
    
  //   return Theme(
  //     data:Theme.of(context).copyWith(
  //       canvasColor: Color.fromRGBO(0, 134, 175, 0.8),
  //       primaryColor: Color.fromRGBO(255, 255, 0, 1.0),
        
  //       textTheme: Theme.of(context).textTheme
  //       .copyWith(caption: prefix0.TextStyle(color: Color.fromRGBO(255, 255, 0, 1.0)))
  //     ),

  //     child: BottomNavigationBar(
 
  //       selectedFontSize:12.0,
        
  //       unselectedFontSize: 12.0,

  //       items: [
    
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.search, size: 30,),
  //           title: Text('Consultar Bien'),
  //           ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.help_outline, size: 30,),
  //           title: Text('¿Cómo funciona?')
  //           ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.mail, size: 30,),
  //           title: Text('Contacto')
  //           ),
        
  //       ],

  //       //onTap: _onTap,
       
  //     ),
      


  //   );



  // }
  //   _onTap(int index){
  //   print(index);
  //   setState(() {
  //   index = index;
  // });

  //   if(index == 0){
  //     Navigator.of(context)
  //     .push(MaterialPageRoute<Null>(builder: (BuildContext context){
  //       return new ConsultaBien();
  //     })
  //     );
  //   }
  //   if(index == 1){
  //     Navigator.of(context)
  //     .push(MaterialPageRoute<Null>(builder: (BuildContext context){
  //       return new ComoFunciona();
  //     })
  //     );
  //   }
    

   
  // }
}