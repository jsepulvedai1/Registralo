import 'package:disenos/src/pages/consultaBien.dart';
import 'package:disenos/src/pages/misBienes.dart';
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
            title: const Text('Registralo'),
            bottom: TabBar(
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
final Home _home = Home();

final List<Choice> choices = <Choice>[
  Choice(title: 'Mis Bienes', tabla: _tabla2(),icon: Icons.desktop_mac),
  Choice(title: 'Registrar Bien', tabla: _tabla(),icon: Icons.save),
  Choice(title: 'consulta Bien', tabla: _tabla2(),icon: Icons.search),
  Choice(title: 'Mis Datos', tabla: _tabla(),icon: Icons.person),
  Choice(title: 'Contacto', tabla: _tabla2(),icon: Icons.phone_iphone),
  
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
    body: _home,
    );
      
      
  }

  Widget _tabla2(){
    
    return Scaffold(
    body: _misBienes,
    );
     
      
  }