import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:disenos/src/bloc/login_bloc.dart';
import 'package:disenos/src/pages/misBienes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:disenos/src/pages/Animation/FadeAnimation.dart';
import 'package:disenos/src/bloc/provider.dart';
import 'package:xml/xml.dart' as xml;


class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState(){ 
    return new _LoginPage();
  }
}
class _LoginPage extends State<LoginPage> {

Future<String> _misBienes(String userId) async {
  final response = await http.post("https://soaex.spd.gov.cl/REGISTRALO//Service_Usuario.php",
    headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "User-Agent": "Apache-HttpClient/4.1.1 (java 1.5)",
          "Host": "soaex.spd.gov.cl",
          "SOAPAction": "web:WSRegistralo#usuario_validar", 
          "Connection": "Keep-Alive",
          "Accept-Encoding": "gzip,deflate",

          //"Accept": "text/xml"
    },

  );

}
Future<String> _loginPost(String username, String password) async {
  

  final response = await http.post("https://soaex.spd.gov.cl/REGISTRALO//Service_Auth.php?wsdl",
  
    headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "User-Agent": "Apache-HttpClient/4.1.1 (java 1.5)",
          "Host": "soaex.spd.gov.cl",
          "SOAPAction": "web:WSRegistralo#usuario_validar", 
          "Connection": "Keep-Alive",
          "Accept-Encoding": "gzip,deflate",

          //"Accept": "text/xml"
    },
    body: "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"web:WSRegistralo\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><soapenv:Header><wsse:Security mustUnderstand=\"1\" xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\"><wsse:UsernameToken xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\"><wsse:Username>REGISTRALO</wsse:Username><wsse:Password>9rx2HLXJiTrouc7EyMeLHiTl%2FefY1OU2S8sA8SuqggG%2FHtVQU24Or%2BnifJdUI0WsjZE1YSkxrwZHY8zc249SpXG7T5zSmJcMF9034v%2FpWSk%3D</wsse:Password></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><web:usuario_validar soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><usuario xsi:type=\"xsd:string\">"+username+"</usuario><clave xsi:type=\"xsd:string\">"+password+"</clave></web:usuario_validar></soapenv:Body></soapenv:Envelope>",

  );
  var storeDocument = xml.parse(response.body);
  String succes = storeDocument.findAllElements('success').toString();
  
  if (succes.contains("true")){
   
    Navigator.pushReplacementNamed(context, 'basico');
    
    return  null;
  }else{
     _showDialog();
    return null;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      flexibleSpace: Image(
          image: AssetImage('assets/appbar2.png'), 
          fit: BoxFit.cover
        ),
        backgroundColor: Color.fromRGBO(33, 150, 243, 1.0),
       ),
      body: Stack(
        
        children: <Widget>[
          _fondoApp(),
          Center(
            child: 
                FadeAnimation(1.5, 
               _loginForm(context),
	        ),
             
          ),
         
	      ],
      ),
          
    
      
    );
  }

  Widget _loginForm(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 60.0 ),
                _crearEmail( bloc ),
                SizedBox( height: 30.0 ),
                _crearPassword( bloc ),
                SizedBox( height: 30.0 ),
                _crearBoton( bloc )
              ],
            ),
          ),

          Text('¿Olvido la contraseña?'),
          SizedBox( height: 100.0 )
        ],
      ),
    );


  }

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.yellow ),
            hintText: '100000-1',
            labelText: 'Rut',
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),

      );


      },
    );


  }

  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.deepPurple ),
              labelText: 'Contraseña',
            
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),

        );

      },
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
  Widget _crearBoton( LoginBloc bloc) {

    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {

    print('Email: ${ bloc.email }');
    print('Password: ${ bloc.password }');
    _loginPost(bloc.email,bloc.password);


  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("LOGIN"),
          content: new Text("Credenciales no validas"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );


    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned( top: 90.0, left: 30.0, child: circulo ),
        Positioned( top: -40.0, right: -30.0, child: circulo ),
        Positioned( bottom: -50.0, right: -10.0, child: circulo ),
        Positioned( bottom: 120.0, right: 20.0, child: circulo ),
        Positioned( bottom: -50.0, left: -20.0, child: circulo ),
        
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon( Icons.person_pin_circle, color: Colors.white, size: 100.0 ),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('Fernando Herrera', style: TextStyle( color: Colors.white, fontSize: 25.0 ))
            ],
          ),
        )

      ],
    );

  }

}








































// String username='';
// class SingInOne extends StatefulWidget {
//   @override
//   _SingInOne createState(){
     
//     return new _SingInOne();
//   }
// }

// class _SingInOne extends State<SingInOne> {
// TextEditingController user=new TextEditingController();
// TextEditingController pass=new TextEditingController();

// String msg='';
// String body1 ="<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"web:WSRegistralo\"><soapenv:Header/><soapenv:Body><web:usuario_validar soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><usuario xsi:type=\"xsd:string\">?</usuario><clave xsi:type=\"xsd:string\">?</clave></web:usuario_validar></soapenv:Body></soapenv:Envelope>";

// Future<List> _logint5t() async {
//   final response = await http.post("https://soaex.spd.gov.cl/REGISTRALO//Service_Usuario.php?wsdl", body: {
//     "username": user.text,
//     "password": pass.text,
//   });
//   var datauser = json.decode(response.body);
//   print(datauser);
//   if(datauser.length==0){
//     setState(() {
//           msg="Login Fail";
//         });
//   }else{
//     if(datauser[0]['nivel']=='super'){
//        Navigator.pushNamed(context,'basico');
//        print('super..');
//     }else if(datauser[0]['nivel']=='bodega'){
//       print('bodegaaa');
//       Navigator.pushNamed(context, 'basico');
//     }

//     setState(() {
//           username= datauser[0]['username'];
//         });

//   }

//   return datauser;
// }

// @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//       flexibleSpace: Image(
//           image: AssetImage('assets/appbar2.png'), 
//           fit: BoxFit.cover
//         ),
//         backgroundColor: Color.fromRGBO(33, 150, 243, 1.0),
//         actions: <Widget>[
//             // action button
//             IconButton(
//               icon: Icon(Icons.person_outline, size: 38,),
//               onPressed: ()=> Navigator.pushNamed(context, 'login'),
//             ),
//         ]
//       ),
//       body: 
//       Stack(
//         children: <Widget>[
//          _fondoApp(),
//           Stack(
// 	                children: <Widget>[
// 	                 FadeAnimation(
//                         1, 
                      
//                           _loginForm(context),
// 	                      ),
	                
          
          
//       ],
//       ),
//       ]
//       )
//     );
//     // return Scaffold(
//     //   backgroundColor: Colors.white,
//     //   body: SingleChildScrollView(
//     //   	child: Container(
// 	  //       child: Column(
// 	  //         children: <Widget>[
// 	  //           Container(
// 	  //             height: 400,
// 	  //             decoration: BoxDecoration(
// 	  //               image: DecorationImage(
// 	  //                 image: AssetImage('assets/images/background.png'),
// 	  //                 fit: BoxFit.fill
// 	  //               )
// 	  //             ),
// 	  //             child: Stack(
// 	  //               children: <Widget>[
// 	  //                 Positioned(
// 	  //                   left: 30,
// 	  //                   width: 80,
// 	  //                   height: 200,
// 	  //                   child: FadeAnimation(1, Container(
// 	  //                     decoration: BoxDecoration(
// 	  //                       image: DecorationImage(
// 	  //                         image: AssetImage('assets/images/light-1.png')
// 	  //                       )
// 	  //                     ),
// 	  //                   )),
// 	  //                 ),
// 	  //                 Positioned(
// 	  //                   left: 140,
// 	  //                   width: 80,
// 	  //                   height: 150,
// 	  //                   child: FadeAnimation(1.3, Container(
// 	  //                     decoration: BoxDecoration(
// 	  //                       image: DecorationImage(
// 	  //                         image: AssetImage('assets/images/light-2.png')
// 	  //                       )
// 	  //                     ),
// 	  //                   )),
// 	  //                 ),
// 	  //                 Positioned(
// 	  //                   right: 40,
// 	  //                   top: 40,
// 	  //                   width: 80,
// 	  //                   height: 150,
// 	  //                   child: FadeAnimation(1.5, Container(
// 	  //                     decoration: BoxDecoration(
// 	  //                       image: DecorationImage(
// 	  //                         image: AssetImage('assets/images/images_registralo')
// 	  //                       )
// 	  //                     ),
// 	  //                   )),
// 	  //                 ),
// 	  //                 Positioned(
// 	  //                   child: FadeAnimation(1.6, Container(
// 	  //                     margin: EdgeInsets.only(top: 50),
// 	  //                     child: Center(
// 	  //                       child: Text("Registralo.cl", 
//     //                       style: TextStyle(
//     //                       color: Colors.white, fontSize: 40, 
//     //                       fontWeight: FontWeight.bold),),
                          
// 	  //                     ),
// 	  //                   )),
// 	  //                 )
// 	  //               ],
// 	  //             ),
// 	  //           ),
// 	  //           Padding(
// 	  //             padding: EdgeInsets.all(30.0),
// 	  //             child: Column(
// 	  //               children: <Widget>[
// 	  //                 FadeAnimation(1.8, Container(
// 	  //                   padding: EdgeInsets.all(5),
// 	  //                   decoration: BoxDecoration(
// 	  //                     color: Colors.white,
// 	  //                     borderRadius: BorderRadius.circular(10),
// 	  //                     boxShadow: [
// 	  //                       BoxShadow(
// 	  //                         color: Color.fromRGBO(0, 0, 0, .2),
// 	  //                         blurRadius: 20.0,
// 	  //                         offset: Offset(0, 10)
// 	  //                       )
// 	  //                     ]
// 	  //                   ),
// 	  //                   child: Column(
// 	  //                     children: <Widget>[
// 	  //                       Container(
// 	  //                         padding: EdgeInsets.all(8.0),
// 	  //                         decoration: BoxDecoration(
// 	  //                           border: Border(bottom: BorderSide(color: Colors.grey[100]))
// 	  //                         ),
// 	  //                         child: TextField(
//     //                           controller: user,  
// 	  //                           decoration: InputDecoration(
// 	  //                             border: InputBorder.none,
// 	  //                             hintText: "RUT",
// 	  //                             hintStyle: TextStyle(color: Colors.grey[400])
// 	  //                           ),
// 	  //                         ),
// 	  //                       ),
// 	  //                       Container(
// 	  //                         padding: EdgeInsets.all(8.0),
// 	  //                         child: TextField(
//     //                           obscureText: true,
//     //                           controller: pass,  
// 	  //                           decoration: InputDecoration(
// 	  //                             border: InputBorder.none,
// 	  //                             hintText: "Contraseña",
// 	  //                             hintStyle: TextStyle(color: Colors.grey[400])
// 	  //                           ),
// 	  //                         ),
// 	  //                       )
// 	  //                     ],
// 	  //                   ),
// 	  //                 )),
// 	  //                 SizedBox(height: 30,),
// 	  //                 FadeAnimation(2, Container(
// 	  //                   height: 50,
// 	  //                   decoration: BoxDecoration(
// 	  //                     borderRadius: BorderRadius.circular(10),
// 	  //                     gradient: LinearGradient(
// 	  //                       colors: [
// 	  //                         Color.fromRGBO(120, 200, 240, 1),
// 	  //                         Color.fromRGBO(120, 200, 240, .6),
// 	  //                       ]
// 	  //                     )
// 	  //                   ),
// 	  //                   child: Center(
// 	  //                           child: RaisedButton(
//     //                       child: Text("Login"),
//     //                         onPressed: (){
//     //                           _login();
//     //                         Navigator.pop(context); 
//     //                       },
//     //                     ),
                        
// 	  //                   ),
// 	  //                 )),
// 	  //                 SizedBox(height: 70,),
// 	  //                 FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
// 	  //               ],
// 	  //             ),
// 	  //           )
// 	  //         ],
// 	  //       ),
// 	  //     ),
//     //   )
//     // );
//   }

//   Widget _loginForm(BuildContext context) {
//     //print(context);
//     final bloc = Provider.of(context);
//     final size = MediaQuery.of(context).size;

//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[

//           SafeArea(
//             child: Container(
//               height: 180.0,
//             ),
//           ),

//           Container(
//             width: size.width * 0.85,
//             margin: EdgeInsets.symmetric(vertical: 30.0),
//             padding: EdgeInsets.symmetric( vertical: 50.0 ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5.0),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 3.0,
//                   offset: Offset(0.0, 5.0),
//                   spreadRadius: 3.0
//                 )
//               ]
//             ),
//             child: Column(
//               children: <Widget>[
//               //  Text('Ingreso', style: TextStyle(fontSize: 20.0)),
//               //   SizedBox( height: 60.0 ),
//               //   _crearEmail( bloc ),
//               //   SizedBox( height: 30.0 ),
//               //   _crearPassword( bloc ),
//               //   SizedBox( height: 30.0 ),
//               //   _crearBoton( bloc )
//               ],
//             ),
//           ),

//           Text('¿Olvido la contraseña?'),
//           SizedBox( height: 100.0 )
//         ],
//       ),
//     );


//   }
//   Widget _crearEmail(LoginBloc bloc) {

//     return StreamBuilder(
//       stream: bloc.emailStream,
//       builder: (BuildContext context, AsyncSnapshot snapshot){
        
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 20.0),

//         child: TextField(
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
//             hintText: 'ejemplo@correo.com',
//             labelText: 'Correo electrónico',
//             counterText: snapshot.data,
//             errorText: snapshot.error
//           ),
//           onChanged: bloc.changeEmail,
//         ),

//       );


//       },
//     );


//   }

//   Widget _crearPassword(LoginBloc bloc) {

//     return StreamBuilder(
//       stream: bloc.passwordStream,
//       builder: (BuildContext context, AsyncSnapshot snapshot){
        
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),

//           child: TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//               icon: Icon( Icons.lock_outline, color: Colors.deepPurple ),
//               labelText: 'Contraseña',
//               counterText: snapshot.data,
//               errorText: snapshot.error
//             ),
//             onChanged: bloc.changePassword,
//           ),

//         );

//       },
//     );


//   }

//   Widget _crearBoton( LoginBloc bloc) {

//     // formValidStream
//     // snapshot.hasData
//     //  true ? algo si true : algo si false

//     return StreamBuilder(
//       stream: bloc.formValidStream,
//       builder: (BuildContext context, AsyncSnapshot snapshot){
        
//         return RaisedButton(
//           child: Container(
//             padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
//             child: Text('Ingresar'),
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5.0)
//           ),
//           elevation: 0.0,
//           color: Colors.deepPurple,
//           textColor: Colors.white,
//           onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
//         );
//       },
//     );
//   }

//   _login(LoginBloc bloc, BuildContext context) {

//     print('================');
//     print('Email: ${ bloc.email }');
//     print('Password: ${ bloc.password }');
//     print('================');

//     Navigator.pushReplacementNamed(context, 'home');

//   }

//    Widget _fondoApp(){
//     final gradiente = Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: FractionalOffset(0.0, 0.6),
//           end: FractionalOffset(0.0, 1.0),
//           colors: [
//             Color.fromRGBO(120, 200, 240, 1.0),
//             Color.fromRGBO(128, 208, 250, 2.0)
//           ]
//         )
//       ),
//     );
//     final cajaRosa = Transform.rotate(
//       angle: -pi / 5.0,
//       // child: Container(
//       //   height: 360.0,
//       //   width: 360.0,
//       //   decoration: BoxDecoration(
//       //     borderRadius: BorderRadius.circular(80.0),
//       //     gradient: LinearGradient(
//       //       colors: [
//       //         Colors.blue[600],
//       //       ]
//       //     )
//       //   ),
//       // )
//     );
//      return Stack(
//       children: <Widget>[
//         gradiente,
//         Positioned(
//           top: -100.0,
//           child: cajaRosa
//         )
//       ],
//     );
//   }
// }


















// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// //import 'package:/Animation/FadeAnimation.dart';
// import 'package:disenos/src/pages/Animation/FadeAnimation.dart';

// String username='';
// class SingInOne extends StatefulWidget {
//   @override
//   _SingInOne createState(){ 
//     return new _SingInOne();
//   }
// }

// class _SingInOne extends State<SingInOne> {
// TextEditingController user=new TextEditingController();
// TextEditingController pass=new TextEditingController();

// String msg='';
// String body1 ="<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"web:WSRegistralo\"><soapenv:Header/><soapenv:Body><web:usuario_validar soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><usuario xsi:type=\"xsd:string\">?</usuario><clave xsi:type=\"xsd:string\">?</clave></web:usuario_validar></soapenv:Body></soapenv:Envelope>";

// Future<List> _login() async {
//   final response = await http.post("https://soaex.spd.gov.cl/REGISTRALO//Service_Usuario.php?wsdl", body: {
//     "username": user.text,
//     "password": pass.text,
//   });
//   var datauser = json.decode(response.body);
//   print(datauser);
//   if(datauser.length==0){
//     setState(() {
//           msg="Login Fail";
//         });
//   }else{
//     if(datauser[0]['nivel']=='super'){
//        Navigator.pushNamed(context,'basico');
//        print('super..');
//     }else if(datauser[0]['nivel']=='bodega'){
//       print('bodegaaa');
//       Navigator.pushNamed(context, 'basico');
//     }

//     setState(() {
//           username= datauser[0]['username'];
//         });

//   }

//   return datauser;
// }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//       	child: Container(
// 	        child: Column(
// 	          children: <Widget>[
// 	            Container(
// 	              height: 400,
// 	              decoration: BoxDecoration(
// 	                image: DecorationImage(
// 	                  image: AssetImage('assets/images/background.png'),
// 	                  fit: BoxFit.fill
// 	                )
// 	              ),
// 	              child: Stack(
// 	                children: <Widget>[
// 	                  Positioned(
// 	                    left: 30,
// 	                    width: 80,
// 	                    height: 200,
// 	                    child: FadeAnimation(1, Container(
// 	                      decoration: BoxDecoration(
// 	                        image: DecorationImage(
// 	                          image: AssetImage('assets/images/light-1.png')
// 	                        )
// 	                      ),
// 	                    )),
// 	                  ),
// 	                  Positioned(
// 	                    left: 140,
// 	                    width: 80,
// 	                    height: 150,
// 	                    child: FadeAnimation(1.3, Container(
// 	                      decoration: BoxDecoration(
// 	                        image: DecorationImage(
// 	                          image: AssetImage('assets/images/light-2.png')
// 	                        )
// 	                      ),
// 	                    )),
// 	                  ),
// 	                  Positioned(
// 	                    right: 40,
// 	                    top: 40,
// 	                    width: 80,
// 	                    height: 150,
// 	                    child: FadeAnimation(1.5, Container(
// 	                      decoration: BoxDecoration(
// 	                        image: DecorationImage(
// 	                          image: AssetImage('assets/images/clock.png')
// 	                        )
// 	                      ),
// 	                    )),
// 	                  ),
// 	                  Positioned(
// 	                    child: FadeAnimation(1.6, Container(
// 	                      margin: EdgeInsets.only(top: 50),
// 	                      child: Center(
// 	                        child: Text("Registralo.cl", 
//                           style: TextStyle(
//                           color: Colors.white, fontSize: 40, 
//                           fontWeight: FontWeight.bold),),
                          
// 	                      ),
// 	                    )),
// 	                  )
// 	                ],
// 	              ),
// 	            ),
// 	            Padding(
// 	              padding: EdgeInsets.all(30.0),
// 	              child: Column(
// 	                children: <Widget>[
// 	                  FadeAnimation(1.8, Container(
// 	                    padding: EdgeInsets.all(5),
// 	                    decoration: BoxDecoration(
// 	                      color: Colors.white,
// 	                      borderRadius: BorderRadius.circular(10),
// 	                      boxShadow: [
// 	                        BoxShadow(
// 	                          color: Color.fromRGBO(0, 0, 0, .2),
// 	                          blurRadius: 20.0,
// 	                          offset: Offset(0, 10)
// 	                        )
// 	                      ]
// 	                    ),
// 	                    child: Column(
// 	                      children: <Widget>[
// 	                        Container(
// 	                          padding: EdgeInsets.all(8.0),
// 	                          decoration: BoxDecoration(
// 	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
// 	                          ),
// 	                          child: TextField(
//                               controller: user,  
// 	                            decoration: InputDecoration(
// 	                              border: InputBorder.none,
// 	                              hintText: "RUT",
// 	                              hintStyle: TextStyle(color: Colors.grey[400])
// 	                            ),
// 	                          ),
// 	                        ),
// 	                        Container(
// 	                          padding: EdgeInsets.all(8.0),
// 	                          child: TextField(
//                               obscureText: true,
//                               controller: pass,  
// 	                            decoration: InputDecoration(
// 	                              border: InputBorder.none,
// 	                              hintText: "Contraseña",
// 	                              hintStyle: TextStyle(color: Colors.grey[400])
// 	                            ),
// 	                          ),
// 	                        )
// 	                      ],
// 	                    ),
// 	                  )),
// 	                  SizedBox(height: 30,),
// 	                  FadeAnimation(2, Container(
// 	                    height: 50,
// 	                    decoration: BoxDecoration(
// 	                      borderRadius: BorderRadius.circular(10),
// 	                      gradient: LinearGradient(
// 	                        colors: [
// 	                          Color.fromRGBO(120, 200, 240, 1),
// 	                          Color.fromRGBO(120, 200, 240, .6),
// 	                        ]
// 	                      )
// 	                    ),
// 	                    child: Center(
// 	                            child: RaisedButton(
//                           child: Text("Login"),
//                             onPressed: (){
//                               _login();
//                             Navigator.pop(context); 
//                           },
//                         ),
                        
// 	                    ),
// 	                  )),
// 	                  SizedBox(height: 70,),
// 	                  FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
// 	                ],
// 	              ),
// 	            )
// 	          ],
// 	        ),
// 	      ),
//       )
//     );
//   }
// }






