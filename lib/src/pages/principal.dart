
import 'package:Registralo2/src/pages/comoFunciona.dart';
import 'package:Registralo2/src/pages/consultaBien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:math';
import 'dart:ui';
import 'contacto.dart';
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
              onPressed: ()=>  Navigator.pushNamed(context, 'login'),
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
//           Text('Registralo2.cl', style: TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold )),
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
        canvasColor: Color.fromRGBO(0, 134, 175, 0.8),
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
            title: Text('Consultar Bien'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline, size: 30,),
            title: Text('¿Cómo funciona?')
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, size: 30,),
            title: Text('Contacto')
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
        return new Contacto();
      })
      );
    }

  }
}


































































// import 'package:Registralo2/src/pages/NavBarPostLogin.dart';
// import 'package:Registralo2/src/pages/comoFunciona.dart';
// import 'package:Registralo2/src/pages/consultaBien.dart';
// import 'package:Registralo2/src/pages/post_login.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'dart:math';
// import 'dart:ui';
// import 'contacto.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';



// class BotonesPage extends StatefulWidget {


//   @override
//   _BotonesPage createState(){
//     return new _BotonesPage();
//   }
// }

// class _BotonesPage extends State<BotonesPage> {



//   @override
//   Widget build(BuildContext context) {
 
 

//     return Scaffold(

//       appBar: AppBar(
        
//         flexibleSpace: Image(
//           image: AssetImage('assets/appbar2.png'), 
//           fit: BoxFit.cover
    

//           ),

       
//         actions: <Widget>[
//             // action button
//             IconButton(
//               icon: Icon(Icons.person_outline, size: 38,),
//               onPressed: ()=>  Navigator.pushNamed(context, 'login'),
//             ),
//         ]
//       ),

//         bottomNavigationBar: CurvedNavigationBar(
      
//         height: 50.0,
//         items:<Widget> [
//         Icon(Icons.search, size: 30, color: Color.fromRGBO(0, 164, 214, 1),),
//         Icon(Icons.help_outline, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
//         Icon(Icons.mail, size: 30, color: Color.fromRGBO(0, 164, 214, 1)),
     
//         ],
        
//         color: Colors.white,
//         buttonBackgroundColor: Color.fromRGBO(255,255,255,1),
//         backgroundColor: Color.fromRGBO( 120, 200, 240, 1.0),
//         animationCurve: Curves.easeOutBack,
//         animationDuration: Duration(milliseconds: 1000),
//         onTap: _onTap,
//         ),

//       body: 
//       Stack(
     
//       children: <Widget>[
//          _fondoApp(),
        
//           SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 _carouselImages(), 
//               ],
//               ),
//           ),
//       ],
//       ),
   

//     );
//   }



//   Widget _fondoApp(){
//     final gradiente = Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: FractionalOffset(0.0, 0.6),
//           end: FractionalOffset(0.0, 1.0),
//           colors: [
//             Color.fromRGBO(120, 200, 240, 1.0),
//             Color.fromRGBO(120, 200, 240, 1.0)
//           ]
//         )
//       ),
//     );
//     final cajaRosa = Transform.rotate(
//       angle: -pi / 5.0,
//     );
    
//     return Stack(
//       children: <Widget>[
//         gradiente,
//         Positioned(
//           top: -100.0,
//           child: cajaRosa
//         )
//       ],
//     );
//   }

//     Widget _carouselImages(){
//      return Container(
      
      
//       width: double.infinity,
//       height: 600.0,
//       child: Carousel(
    
//         images:[
//           Image.asset('assets/banner1_vertical_02.png'),
//           Image.asset('assets/banner2_vertical_02.png'),
//           Image.asset('assets/banner3_vertical_02.png'),
//         ],
//         autoplay:true ,
//         autoplayDuration: const Duration(seconds: 4),
//         boxFit: BoxFit.contain,
        
//         indicatorBgPadding: 0.3,
//         borderRadius: true,
//         showIndicator: true,
//         dotBgColor: Colors.grey.withOpacity(0.3),
//       ),
//      );
//     }

//     //Index TabBar 

//   _onTap(int index){
//     print(index);
//     setState(() {
//     index = index;
//   });

//     if(index == 0){ 
//       Navigator.of(context)
//       .push(MaterialPageRoute<Null>(builder: (BuildContext context){
//         return new Home();
//       })
//       );
//     }
//     if(index == 1){
//       Navigator.of(context)
//       .push(MaterialPageRoute<Null>(builder: (BuildContext context){
//         return new ComoFunciona();
//       })
//       );
//     }
//     if(index == 2){
//       Navigator.of(context)
//       .push(MaterialPageRoute<Null>(builder: (BuildContext context){
//         return new Contacto();
//       })
//       );
      
//     }
   
    
  
   
    

   
//   }



// }
