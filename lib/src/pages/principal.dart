import 'package:disenos/src/pages/NavBarPostLogin.dart';
import 'package:disenos/src/pages/comoFunciona.dart';
import 'package:disenos/src/pages/consultaBien.dart';
import 'package:disenos/src/pages/imei.dart';
import 'package:disenos/src/pages/post_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:math';
import 'dart:ui';
import 'contacto.dart';
import 'package:disenos/src/pages/LoginForm.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class BotonesPage extends StatefulWidget {


  @override
  _BotonesPage createState(){
    return new _BotonesPage();
  }
}

class _BotonesPage extends State<BotonesPage> {



  @override
  Widget build(BuildContext context) {
 
 

    return Scaffold(

      appBar: AppBar(
        
        flexibleSpace: Image(
          image: AssetImage('assets/appbar2.png'), 
          fit: BoxFit.cover
    

          ),

       
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.person_outline, size: 38,),
              onPressed: ()=> Navigator.pushNamed(context, 'login'),
            ),
        ]
      ),

        bottomNavigationBar: CurvedNavigationBar(
      
        height: 50.0,
        items:<Widget> [
        Icon(Icons.search, size: 30, color: Color.fromRGBO(0, 164, 214, 1),),
        Icon(Icons.help_outline, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
        Icon(Icons.mail, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
        Icon(Icons.person, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
        Icon(Icons.mail, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
        ],
        
        color: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(255,255,255,1),
        backgroundColor: Color.fromRGBO( 120, 200, 240, 1.0),
        animationCurve: Curves.easeOutBack,
        animationDuration: Duration(milliseconds: 1000),
        onTap: _onTap,
        ),

      body: 
      Stack(
     
      children: <Widget>[
         _fondoApp(),
        
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _carouselImages(), 
              ],
              ),
          ),
      ],
      ),
   

    );
  }



  Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(120, 200, 240, 1.0),
            Color.fromRGBO(120, 200, 240, 1.0)
          ]
        )
      ),
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
    );
    
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa
        )
      ],
    );
  }

    Widget _carouselImages(){
     return Container(
      
      
      width: double.infinity,
      height: 600.0,
      child: Carousel(
    
        images:[
          Image.asset('assets/banner1_vertical_02.png'),
          Image.asset('assets/banner2_vertical_02.png'),
          Image.asset('assets/banner3_vertical_02.png'),
        ],
        autoplay:true ,
        autoplayDuration: const Duration(seconds: 4),
        boxFit: BoxFit.contain,
        
        indicatorBgPadding: 0.3,
        borderRadius: true,
        showIndicator: true,
        dotBgColor: Colors.grey.withOpacity(0.3),
      ),
     );
    }

    //Index TabBar 

  _onTap(int index){
    print(index);
    setState(() {
    index = index;
  });

    if(index == 0){ 
      Navigator.of(context)
      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new Home();
      })
      );
    }
    if(index == 1){
      Navigator.of(context)
      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new ComoFunciona();
      })
      );
    }
    if(index == 2){
      Navigator.of(context)
      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
        return new LoginForm();
      })
      );
      
    }
    if(index == 3){
    Navigator.of(context)
    .push(MaterialPageRoute<Null>(builder: (BuildContext context){
      return new Imei();
   
    })
    
    );
    
  }
    if(index == 4){
    Navigator.of(context)
    .push(MaterialPageRoute<Null>(builder: (BuildContext context){
      return new BottomNavBar();
   
    })
    
    );
    
  }
    

   
  }



}
