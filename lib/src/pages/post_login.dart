import 'package:Registralo/src/pages/consultaBien.dart';
import 'package:Registralo/src/pages/contacto.dart';
import 'package:Registralo/src/pages/misBienes.dart';
import 'package:Registralo/src/pages/registrarBien.dart';
import 'package:Registralo/src/pages/misDatos.dart';
import 'package:Registralo/src/pages/ContactoPostLogin.dart';
import 'package:flutter/material.dart';

import 'registrar_bien.dart';
 
class TabbedAppBarDemo extends StatefulWidget {


  @override
  _TabbedAppBarDemo createState(){
    
    return new _TabbedAppBarDemo();
  }
}

class _TabbedAppBarDemo extends State<TabbedAppBarDemo> {


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
        appBar: AppBar(
      flexibleSpace: Image(
          image: AssetImage('assets/appbar2.png'), 
          fit: BoxFit.cover
        ),
        backgroundColor: Color.fromRGBO(33, 150, 243, 1.0),
       ),
          backgroundColor: Color.fromRGBO(120, 200, 240, 1.0),
          body: TabBarView(
      
            children: choices.map((Choice choice) {
              return Scaffold(
              body: 
                 ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
          extendBody: false,
          bottomNavigationBar: BottomAppBar(
            color:Color.fromRGBO(33, 150, 243, 1.0),
            child:  TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(
                    choice.icon,
                    //color:  Color.fromRGBO(105, 234, 15, 0)),
                
                  
                ));
              }).toList(),
            ),
            ),
        ),
      ),
    );
  }
}
 
class Choice {
  final String title;
  final Widget tabla;
  final IconData  icon;
  final Color color;
  Choice({this.title, this.tabla,this.icon,this.color});
}
final MisBienes _misBienes =  MisBienes();
//final Home _home = Home();
final Contacto contacto = Contacto();
final RegistrarBien _registrarBien = RegistrarBien();
final ConsultaBienPostLogin _consultaBienPostLogin = ConsultaBienPostLogin();
final MisDatos _misDatos = MisDatos();
final ContactoPostLogin _contactoPostLogin = ContactoPostLogin();
final Home _consultarBien = Home();

final List<Choice> choices = <Choice>[
  Choice(title: 'Mis Bienes', tabla: _tabla(),icon: Icons.desktop_mac, color: Color.fromRGBO(255, 255, 0, 0)),
  Choice(title: 'Registrar Bien', tabla: _tabla2(),icon: Icons.save,color: Color.fromRGBO(255, 255, 0, 0)),
  Choice(title: 'consulta Bien', tabla: _tabla3(),icon: Icons.search,color: Color.fromRGBO(255, 255, 0, 0)),
  Choice(title: 'Mis Datos', tabla: _tabla4(),icon: Icons.person,color: Color.fromRGBO(255, 255, 0, 0)),
  Choice(title: 'Contactos', tabla: _tabla5(),icon: Icons.phone_iphone,color: Color.fromRGBO(255, 255, 0, 0)),
  
];
 
class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;
    
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          backgroundColor: Color.fromRGBO(120, 200, 240, 1.0),
          body:
            choice.tabla
    );
     
    
  }
}
  Widget _tabla(){
    return Scaffold(
      body: _misBienes,
    );
  }

  Widget _tabla2(){
    return Scaffold(
      body: _consultaBienPostLogin,
    );
  }
  
   Widget _tabla3(){
  return Scaffold(
  body: _consultarBien,
  );}
  
  Widget _tabla4(){
    return Scaffold(
    body: _misDatos,
    );
  }
  
  Widget _tabla5(){
    return Scaffold(
      body: _contactoPostLogin,
    );
  }
