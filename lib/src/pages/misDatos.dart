import 'package:flutter/material.dart';

class MisDatos  extends StatelessWidget {
  @override
      Widget build(BuildContext context) {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'ListViews',
          theme: ThemeData(
            backgroundColor: Color.fromRGBO(140, 208, 242, 1),
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            backgroundColor: Color.fromRGBO(140, 208, 242, 1),
            appBar: AppBar(title: Text('Mis Datos')),
            body: MisBienesView(),
          ),
        );
      }
}
void actionTest() {
    print('asdsad');
}
class MisBienesView extends StatelessWidget {
@override
final test = 'Lorem ipsum dolor sit amet consectetur ';
final data = 'Lorem ipsum dolor sit amet consectetur ';

  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(140, 208, 242, 1),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child:Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 25 ),
                    child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            title: Text("Nombre"),
                            subtitle: Text('Felipe Avello'),
                          ),
                            new SizedBox(
                            width: 300.0,
                            height: 120.0,
                            child:   ListTile(
                            title: Text("Email"),
                            subtitle: Text('f.avello@gmail.com'),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    }
}


   