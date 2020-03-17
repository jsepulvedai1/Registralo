import 'dart:async';
import 'dart:math';
import 'package:Registralo2/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Registralo2/src/pages/Animation/FadeAnimation.dart';
import 'package:Registralo2/src/bloc/provider.dart';
import 'package:xml/xml.dart' as xml;


class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState(){ 
    return new _LoginPage();
  }
}
class _LoginPage extends State<LoginPage> {

Future<String> _loginPost(String username, String password) async {
  

  final response = await http.post("https://soaex.spd.gov.cl/Registralo2//Service_Auth.php?wsdl",
  
    headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "User-Agent": "Apache-HttpClient/4.1.1 (java 1.5)",
          "Host": "soaex.spd.gov.cl",
          "SOAPAction": "web:WSRegistralo2#usuario_validar", 
          "Connection": "Keep-Alive",
          "Accept-Encoding": "gzip,deflate",

          //"Accept": "text/xml"
    },
    body: "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"web:WSRegistralo2\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><soapenv:Header><wsse:Security mustUnderstand=\"1\" xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\"><wsse:UsernameToken xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\"><wsse:Username>Registralo2</wsse:Username><wsse:Password>9rx2HLXJiTrouc7EyMeLHiTl%2FefY1OU2S8sA8SuqggG%2FHtVQU24Or%2BnifJdUI0WsjZE1YSkxrwZHY8zc249SpXG7T5zSmJcMF9034v%2FpWSk%3D</wsse:Password></wsse:UsernameToken></wsse:Security></soapenv:Header><soapenv:Body><web:usuario_validar soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><usuario xsi:type=\"xsd:string\">"+username+"</usuario><clave xsi:type=\"xsd:string\">"+password+"</clave></web:usuario_validar></soapenv:Body></soapenv:Envelope>",

  );
  var storeDocument = xml.parse(response.body);
  String succes = storeDocument.findAllElements('success').toString();
  
  if (succes.contains("true")){
    //_misBienes("ds");
    //Navigator.pushReplacementNamed(context, 'basico');
    Navigator.of(context).pushNamedAndRemoveUntil('basico', (Route<dynamic> route) => false);
    
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
            icon: Icon( Icons.alternate_email, color: Colors.black ),
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
              icon: Icon( Icons.lock_outline, color: Colors.black ),
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
          color: Colors.black26,
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


}








































