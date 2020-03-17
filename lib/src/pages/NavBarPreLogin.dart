//No se esta usando
import 'package:disenos/src/pages/ContactoPostLogin.dart';
import 'package:disenos/src/pages/LoginForm.dart';
import 'package:disenos/src/pages/comoFunciona.dart';
import 'package:disenos/src/pages/consultaBien.dart';
import 'package:disenos/src/pages/imei.dart';
import 'package:disenos/src/pages/misDatos.dart';
import 'package:disenos/src/pages/principal.dart';
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


  final Home _home=  Home();
  final ComoFunciona _comoFunciona = new ComoFunciona();

  final Imei _imei = new Imei();
  final BotonesPage _botonesPage = new BotonesPage();



  Widget _showPage = new MisBienes();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
      return  _botonesPage;
      break;

      case 1:
      return _home;
      break;

      case 2:
      return _comoFunciona;
      break;

      case 3:
      return _comoFunciona;
      break;

      case 4:
      return _imei;
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
        )
        );
  }
}