import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:math';
import 'dart:ui';

class BotonesPage extends StatefulWidget {
  BotonesPage({Key key}) : super(key: key);

  @override
  _BotonesPage createState() => _BotonesPage();
}

class _BotonesPage extends State<BotonesPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido '),
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.person_outline),
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

                
                _swiperTarjetas(), 
                _pagina2(),  
                //_titulos(),
                _botonesRedondeados()
              ],
              ),
          ),
          
        // Container (
        //   child: Column(
        //   children: <Widget>[
        //   _swiperTarjetas()
        //     ],
        //     )
        // ),

      ],
      ),
  
    
     

    );
  }
  Widget _pagina2() {
  return SafeArea(
    child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Registralo.cl', style: TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold )),
          SizedBox( height: 20.0 ),
          Text('Para registrar bienes y consultar mayor detalle de bienes registrados en el sistema, debes inscribirte, completando en el icono REGISTRATE,', style: TextStyle( color: Colors.white, fontSize: 18.0 )),
        ],
      ),
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
            Color.fromRGBO(148, 196, 254, 1.0),
            Color.fromRGBO(0, 132, 170, 1.0)
          ]
        )
      ),
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Colors.blue[600],
            ]
          )
        ),
      )
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
    Widget _swiperTarjetas(){
    return Container(
      width: double.infinity,
      height: 170.0,
   
   
      child: new Swiper(
        itemBuilder: (BuildContext context , int index){
          return Image.network('https://registralo.spd.gov.cl/images/banner1.png', 
          fit: BoxFit.fill);
          

        },
       
      
        itemCount: 2,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      

      ),
    );
    
  }
  // Widget _titulos() {
  //   return SafeArea(
  //     child: Container(
  //       padding: EdgeInsets.all(20.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text('Registralro', style: TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold )),
  //           SizedBox( height: 20.0 ),
  //           Text('Para registrar bienes y consultar mayor detalle de bienes registrados en el sistema, debes inscribirte, completando en el icono REGISTRATE,', style: TextStyle( color: Colors.white, fontSize: 18.0 )),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // Widget _bottomNavigationBar(BuildContext context) {
  //   return Theme(
  //     data: Theme.of(context).copyWith(
  //       canvasColor: Color.fromRGBO(200, 164, 214, 1.0),
  //       primaryColor: Colors.pinkAccent,
  //       textTheme: Theme.of(context).textTheme
  //         .copyWith( caption: TextStyle( color: Color.fromRGBO(116, 117, 152, 1.0) ) )
  //     ),
  //     child: BottomNavigationBar(
        
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon( Icons.calendar_today, size: 30.0 ),
  //           title: Container()
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon( Icons.bubble_chart, size: 30.0 ),
  //           title: Container()
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon( Icons.supervised_user_circle, size: 30.0 ),
  //           title: Container()
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _botonesRedondeados() {
   
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.blue, Icons.search, 'Consultar bien' ),
            _crearBotonRedondeado( Colors.green, Icons.info_outline, 'Consejos de prevención' ),
            
            
          ],
        
          
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.orange, Icons.mail, 'Contacto' ),
            _crearBotonRedondeado( Colors.pink, Icons.help_outline, '¿Cómo funciona?' ),
          ]
        ),
        
        
      ],
    );
  }
  Widget _crearBotonRedondeado( Color color, IconData icono, String texto ) {
 
 
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(202, 237, 255, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),
 
        ),
      ),
    );
  }
}