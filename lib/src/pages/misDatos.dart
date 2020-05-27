import 'package:flutter/material.dart';

class MisDatos extends StatelessWidget {
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
        body: MisBienesView(),
      ),
    );
  }
}

void actionTest() {
  print('asdsad');
}

class MisBienesView extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(140, 208, 242, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            title: Text("Rut"),
                            subtitle: Text('20304050'),
                            
                          ),
                          ListTile(
                            title: Text("Nombres"),
                            subtitle: Text("Javier Isaac"),
                          ),
                          ListTile(
                            title: Text("Apellidos"),
                            subtitle: Text("Sepulveda Ibañez"),
                          ),
                          ListTile(
                            title: Text("Telefono"),
                            subtitle: Text("Sepulveda Ibañez"),
                          ),
                          ListTile(
                            title: Text("Dirrección"),
                            subtitle: Text("Rapel 1234 Conchali"),
                          ),
                          new SizedBox(
                            width: 300.0,
                            height: 60.0,
                            child: new RaisedButton(
                              child: new Text('Editar datos'),
                              onPressed: actionTest,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
