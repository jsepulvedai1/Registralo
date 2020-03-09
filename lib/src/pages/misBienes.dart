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
            appBar: AppBar(title: Text('Mis Bienes')),
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

    class DetalleBienView extends StatelessWidget {
      @override
      final post = 'post';

      Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                  title: Text('Detalle'),
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ), 
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ListTile(
                              title: Text("Número #"),
                              subtitle: Text('19232'),
                            ),
                            ListTile(
                              title: Text("Estado Actual"),
                              subtitle: Text("${post}"),
                            ),
                            ListTile(
                              title: Text("Descripción del bien"),
                              subtitle: Text(post),
                            ),
                            ListTile(
                              title: Text("Modificar Datos"),
                              subtitle: Text("${post}"),
                            ),
                                ListTile(
                            title: Text("Descargar Cerficado"),
                            subtitle: Text("${post}"),
                          ),
                                ListTile(
                            title: Text("Cambiar Estado"),
                            subtitle: Text("${post}"),
                          ),
                              ListTile(
                              title: Text("Transferir"),
                              subtitle: Text("${post}"),
                            ),
                                ListTile(
                              title: Text("Eliminar"),
                              subtitle: Text("${post}"),
                            ),
                          ],
                        ),
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
    

      final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria', 
              'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
              'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
              'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
              'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
              'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
              'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
              'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
              'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

      return ListView.builder(
          itemCount: europeanCountries.length,
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(europeanCountries[index]),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DetalleBienView()));
              },
            ),
          );    
        },
      );
    }

    