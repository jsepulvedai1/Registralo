import 'package:disenos/src/pages/ContactoPostLogin.dart';
import 'package:disenos/src/pages/misDatos.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:disenos/src/pages/consultaBienPostLogin.dart';
import 'package:disenos/src/pages/misBienes.dart';
import 'package:disenos/src/pages/registrarBien.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();


  final MisBienes _misBienes=  MisBienes();
  final RegistrarBien _registrarBien = new RegistrarBien();
  final ConsultaBienPostLogin _consultaBien = new ConsultaBienPostLogin();
  final MisDatos _misDatos = new MisDatos();
  final ContactoPostLogin _contactoPostLogin = new ContactoPostLogin();



  Widget _showPage = new MisBienes();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
      return  _misBienes;
      break;

      case 1:
      return _registrarBien;
      break;

      case 2:
      return _consultaBien;
      break;

      case 3:
      return _misDatos;
      break;

      case 4:
      return _contactoPostLogin;
      break;

      default: 
      return new Container(
        child: new Center(
          child: new Text(
            'No page found by page chooser',
            style: new TextStyle(fontSize: 30),
          ),)
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.laptop, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
            Icon(Icons.control_point, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
            Icon(Icons.search, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
            Icon(Icons.account_box, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
            Icon(Icons.email, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
          ],
          color: Colors.white,
          buttonBackgroundColor: Color.fromRGBO(255,255,255,1),
          backgroundColor: Color.fromRGBO(140, 208, 242, 1),
          animationCurve: Curves.easeOutBack,
         
          animationDuration: Duration(milliseconds: 1000),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color:  Color.fromRGBO(140, 208, 242, 1),
          child: Center(
            child: _showPage,
          ),
        ));
  }
}