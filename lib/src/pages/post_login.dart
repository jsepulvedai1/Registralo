import 'package:disenos/src/pages/ContactoPostLogin.dart';
import 'package:disenos/src/pages/consultaBien.dart';
import 'package:disenos/src/pages/consultaBienPostLogin.dart';
import 'package:disenos/src/pages/misBienes.dart';
import 'package:disenos/src/pages/misDatos.dart';
import 'package:disenos/src/pages/registrarBien.dart';
import 'package:flutter/material.dart';
 
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

          //     flexibleSpace: Image(
          // image: AssetImage('assets/appbar2.png'), 
          // fit: BoxFit.cover
    

          // ),
           title: const Text('Bienvenido (Nombre usuario)' ),
            bottom: TabBar(
             // indicatorColor: Color.fromRGBO(41, 51, 125, 1.0),
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(
                    choice.icon
                  ),
                  
                );
              }).toList(),
            ),
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
        ),
      ),
    );
  }
}
 
class Choice {
  final String title;
  final Widget tabla;
  final IconData  icon;
  Choice({this.title, this.tabla,this.icon});
}
final MisBienes _misBienes =  MisBienes();
final RegistrarBien _registrarBien = RegistrarBien();
final ConsultaBienPostLogin _consultaBienPostLogin = ConsultaBienPostLogin();
final MisDatos _misDatos = MisDatos();
final ContactoPostLogin _contactoPostLogin = ContactoPostLogin();

final List<Choice> choices = <Choice>[
  Choice(title: 'Mis Bienes', tabla: _tabla(),icon: Icons.laptop),
  Choice(title: 'Registrar Bien', tabla: _tabla2(),icon: Icons.control_point,),
  Choice(title: 'consulta Bien', tabla: _tabla3(),icon: Icons.search),
  Choice(title: 'Mis Datos', tabla: _tabla4(),icon: Icons.account_box,),
  Choice(title: 'Contacto', tabla: _tabla5(),icon: Icons.email),
  
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
  );}
Widget _tabla2(){
  return Scaffold(
  body: _registrarBien,
  );}
Widget _tabla3(){
    return Scaffold(
    body: _consultaBienPostLogin,
  );}
Widget _tabla4(){
  return Scaffold(
  body: _misDatos,
  );}
Widget _tabla5(){
  return Scaffold(
  body: _contactoPostLogin,
);}