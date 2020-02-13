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
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ChoicePage(
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
 
final List<Choice> choices = <Choice>[
  Choice(title: 'Mis Bienes', tabla: _tabla(),icon: Icons.desktop_mac),
  Choice(title: 'Registrar Bien', tabla: _tabla2(),icon: Icons.save),
  Choice(title: 'consulta Bien', tabla: _tabla2(),icon: Icons.search),
  Choice(title: 'Mis Datos', tabla: _tabla2(),icon: Icons.person),
  Choice(title: 'Contacto', tabla: _tabla2(),icon: Icons.phone_iphone),
  
];
 
class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;
 
  @override
  Widget build(BuildContext context) {
    
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           
            choice.tabla
          ],
        ),
      ),
    );
  }
}

Widget _tabla(){
    
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      children: [
        TableRow(children:[
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text('ID'),
                new Text(['id'].toString()),
              ]
            )
          )
        ]),
      ],
    );
      
  }

  Widget _tabla2(){
    
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      children: [
        TableRow(children:[
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text('ID3'),
                new Text(['id2'].toString()),
              ]
            )
          )
        ]),
      ],
    );
      
  }