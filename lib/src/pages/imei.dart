//imei original fingerprint video

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:local_auth/local_auth.dart';



void main()=> runApp(new MaterialApp(

    home: new Imei()
  ));



class Imei extends StatefulWidget {
  @override 
  _ImeiState createState() => _ImeiState(); 
}
class _ImeiState extends State<Imei> {
  LocalAuthentication auth = LocalAuthentication();

  String imei;
  String _platformImei = 'Unknown';
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = "Not Authorized";

  Future<void> _checkBiometrics() async{
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if(!mounted) return;
    setState((){
      _canCheckBiometrics = canCheckBiometrics;
    });

  }
  Future<void> _getAvailableBiometrics() async{
      List<BiometricType> availableBiometrics;
      try {
        availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if(!mounted) return;
    setState((){
      _availableBiometrics= availableBiometrics;
    });

  }

  Future<void> _authenticate()async{
     bool authenticated = false;
    try{
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: "Scan your fingerprint to authenticate",
        useErrorDialogs: true,
        stickyAuth: false,
      );
    }on PlatformException catch (e){
      print(e);
    }

    if(!mounted) return;
    setState(() {
      _authorized = authenticated ? "Authorized" : "Not Authorized";
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

    // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformImei;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei = await ImeiPlugin.getImei( shouldShowRequestPermissionRationale: true );
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
    if (!mounted) return;

     setState(() {
      _platformImei = platformImei;
    });
  }
  //----> device info
  getDeviceInfo() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    var brand=androidInfo.id;
    var brand5=androidInfo.brand;
    var brand13=androidInfo.model;

    setState(() {
      info=brand;
      info5=brand5;
      info13=brand13;
    });
  }
  String info="";
  String info5="";
  String info13="";

  ///<---------------


  
@override

  Widget build(BuildContext context) {

    
    return new Scaffold (appBar: new AppBar(
      title: Text('Toma de datos del dispositivo'),
      backgroundColor: Color.fromRGBO(73, 190, 226, 1.0),
    ),
        body:  Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Can check biometrics: $_canCheckBiometrics\n'),
              RaisedButton(
                child: const Text('Check biometrics'),
              onPressed: _checkBiometrics,
              ),
              Text('Available biometrics: $_availableBiometrics\n'),
              RaisedButton(
                child: const Text('Get available biometrics'),
                onPressed: _getAvailableBiometrics,
              ),
              Text('Current State: $_authorized\n'),
              RaisedButton(
                child: const Text('Authenticate'),
                onPressed: _authenticate,
              ),
            ]
          ),
          //child: Text('Running on: $_platformImei\n'),
         // child: Text('Running on: $_platformImei\n'),
      
          //-------------------------------------->>device info
          // child: new Column( 
          
          // mainAxisAlignment: MainAxisAlignment.center,
     
          // children: <Widget>[
            //<<<--------------------------------------

            // Text('Current State:\n'),
            // RaisedButton(
            //   child: const Text('Authenticate'),
            //   onPressed: _authenticate,

            // )
            
          //----------------------------------------->  device info
          // new RaisedButton(onPressed: getDeviceInfo, child: new Text("Get info")),
          // new Text('ID:'),
          // new Text(info),
          // new Text(''),
          // new Text('Marca:'),
          // new Text(info5),
          // new Text(''),
          // new Text('Número de modelo:'),
          // new Text(info13),
          //<------------------------------------------
         
         
        //],
        
        ),
        
      );
    //);
  }
}