import 'package:disenos/src/pages/utils/formWidget.dart';
import 'package:flutter/material.dart';

class RegistrarBien extends StatelessWidget {

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
            body: BodyLayout(),
          ),
        );
      }
    }
    class BodyLayout extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return FormWidget();
      }
    }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Color.fromRGBO(140, 208, 242, 1),
  //       appBar: AppBar(
  //         flexibleSpace: Image(
  //           image: AssetImage('assets/registrarBien.png'),
  //           fit: BoxFit.cover,
  //         ),
  //         backgroundColor: Color.fromRGBO(140, 208, 242, 1),
  //       ),
  //       body: Container(
  //         child: Column(
  //           children: <Widget>[
  //            new FormWidget()

  //           ],
  //         ),
  //       ));
  // }

