import 'package:flutter/material.dart';

class MisBienes  extends StatelessWidget {
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

    class MisBienesView extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return _myListView(context);
      }
    }

void actionTest() {
    print('asdsad');
  }

    class DetalleBienView extends StatelessWidget {
      
      final test = 'Teléfonos Celulares / Huawei / ';
      final data;
      DetalleBienView({this.data});
      Widget build(BuildContext context) {
          return Scaffold(
              backgroundColor: Color.fromRGBO(140, 208, 242, 1),
<<<<<<< lib/src/pages/misBienes.dart
=======
              // appBar: AppBar(
              //     title: Text('${data}'),
              //     leading: new IconButton(
              //       icon: new Icon(Icons.arrow_back, color: Colors.white),
              //       onPressed: () => Navigator.of(context).pop(),
              //     ), 
              // ),
>>>>>>> lib/src/pages/misBienes.dart
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
<<<<<<< lib/src/pages/misBienes.dart
                              title: Text("Número #"),
                              subtitle: Text('864205048035745'),
=======
                              title: Text("Bien"),
                              subtitle: Text('${data}'),
                            ),

                            ListTile(
                              title: Text("Número"),
                              subtitle: Text('19232'),
>>>>>>> lib/src/pages/misBienes.dart
                            ),
                            ListTile(
                              title: Text("Estado Actual"),
                              subtitle: Text("Registrado"),
                            ),
                             new SizedBox(
                              
                              width: 300.0,
                              height: 120.0,
                              child:   ListTile(
                              title: Text("Descripción del bien"),
<<<<<<< lib/src/pages/misBienes.dart
                              subtitle: Text(test),
=======
                              subtitle: Text("Teléfonos Celulares \nHUAWEI \n23848329434"),
>>>>>>> lib/src/pages/misBienes.dart
                            ),
                            ),
                          
                            new SizedBox(
                              
                              width: 300.0,
                              height: 60.0,
                              child: new RaisedButton(
                                child: new Text('Modificar Datos'),
                                onPressed: actionTest,
                              ),
                            ),
                            new SizedBox(
                              width: 300.0,
                              height: 60.0,
                              child: new RaisedButton(
                                child: new Text('Descargar Cerficado'),
                                onPressed: actionTest,
                              ),
                            ),
                            new SizedBox(
                              width: 300.0,
                              height: 60.0,
                              child: new RaisedButton(
                                child: new Text('Cambiar Estado'),
                                onPressed: actionTest,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              )
          );
    }

  }

    // replace this function with the code in the examples
    Widget _myListView(BuildContext context) {
    
      final europeanCountries = ['HUAWEI P9','PS3','Camara de video sony','iphone','notebook acer','bicicleta oxford',
      'camara fotografica','HUAWEI P9','PS3','Camara de video sony','iphone','notebook acer','bicicleta oxford','camara fotografica'];

      return ListView.builder(
          itemCount: europeanCountries.length,
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(europeanCountries[index]),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => DetalleBienView(
                      data: europeanCountries[index],
                      )
                      )
                  );
              },
            ),
          );    
        },
      );
    }

    