import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:disenos/src/pages/comoFunciona.dart';
import 'package:disenos/src/pages/contacto.dart';
import 'dart:math';
import 'package:flutter/material.dart' as prefix0;


class ConsultaBien extends StatefulWidget{

  @override
  _ConsultaBienState createState() => _ConsultaBienState();
}

class _ConsultaBienState extends State<ConsultaBien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta Bien"),
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
         Text("   Ingrese los parámetros de búsqueda:", style: TextStyle(color: Colors.blue[800], fontSize: 18, height: 2)),
         
         Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 40, 0, 20),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black87
                        )
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(fontSize: 18,
                      color: Colors.blue[800], 
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                  child: TextFormField(
                    obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 18,
                        color: Colors.blue[800])
                      ),
                  )
                ),
              ],
            ),
          ),


        ],
        
      ),
    
    bottomNavigationBar: _bottomNavigationBar(context),

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
   Widget _bottomNavigationBar(BuildContext context){
    
    return Theme(
      data:Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(0, 134, 175, 0.8),
        primaryColor: Color.fromRGBO(255, 255, 0, 1.0),
        
        textTheme: Theme.of(context).textTheme
        .copyWith(caption: prefix0.TextStyle(color: Color.fromRGBO(255, 255, 0, 1.0)))
      ),

      child: BottomNavigationBar(
 
        selectedFontSize:12.0,
        
        unselectedFontSize: 12.0,

        items: [
    
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30,),
            title: Text('Consultar Bien'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline, size: 30,),
            title: Text('¿Cómo funciona?')
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, size: 30,),
            title: Text('Contacto')
            ),
        
        ],

        onTap: _onTap,
       
      ),
      


    );



  }
    _onTap(int index){
    print(index);
    setState(() {
    index = index;
  });

    
    if(index == 1){
      Navigator.of(context)
      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new ComoFunciona();
      })
      );
    }
    if(index == 2){
      Navigator.of(context)
      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new Contacto();
      })
      );
    }
    

   
  }
}

