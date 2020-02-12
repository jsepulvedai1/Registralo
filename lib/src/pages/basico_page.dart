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
                  icon: Icon(choice.icon),
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
  final IconData icon;
  const Choice({this.title, this.icon});
}
 
const List<Choice> choices = <Choice>[
  Choice(title: 'Mis Bienes', icon: Icons.account_balance_wallet),
  Choice(title: 'Registrar Bien', icon: Icons.beenhere),
  Choice(title: 'Consultar Bien', icon: Icons.search),
  Choice(title: 'Mis Datos', icon: Icons.insert_drive_file),
  Choice(title: 'Contacto', icon: Icons.phone),
];
 
class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;
 
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}