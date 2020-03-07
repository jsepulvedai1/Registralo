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
        backgroundColor: Color.fromRGBO(33, 150, 243, 1.0),
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.person_outline, size: 38,),
              onPressed: ()=> Navigator.pushNamed(context, 'login'),
            ),
        ]
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
      bottomNavigationBar: _bottomNavigationBar(context)

    );
  }
//   Widget _pagina2() {
//   return SafeArea(
//     child: Container(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text('Registralo.cl', style: TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold )),
//           SizedBox( height: 20.0 ),
//           Text('Para registrar bienes y consultar mayor detalle de bienes registrados en el sistema, debes inscribirte, completando en el icono REGISTRATE,', style: TextStyle( color: Colors.white, fontSize: 18.0 )),
//         ],
//       ),
//     ),
//   );
// }




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
            Color.fromRGBO(128, 208, 250, 2.0)
          ]
        )
      ),
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      // child: Container(
      //   height: 360.0,
      //   width: 360.0,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(80.0),
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.blue[600],
      //       ]
      //     )
      //   ),
      // )
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
  Widget _bottomNavigationBar(BuildContext context){
    
    return Theme(
      data:Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(73, 190, 226, 1.0),
        primaryColor: Color.fromRGBO(255, 255, 0, 1.0),
        
        textTheme: Theme.of(context).textTheme
        .copyWith(caption: prefix0.TextStyle(color: Color.fromRGBO(255, 255, 0, 1.0)))
      ),

      child: BottomNavigationBar(


        selectedFontSize:12.0,
        
        unselectedFontSize: 12.0,

        items: [
    
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30,),
            title: Text(''),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline, size: 30,),
            title: Text('¿Cómo funciona?')
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, size: 30,),
            title: Text('Contacto')
            ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 30,),
          title: Text('Contacto')
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.mail, size: 30,),
            title: Text('basico')
            ),
        ],

        onTap: _onTap,
       
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




