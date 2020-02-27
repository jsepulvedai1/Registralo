import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:imei_plugin/imei_plugin.dart';



void main()=> runApp(new MaterialApp(home: new Imei()));



class Imei extends StatefulWidget {
  @override 
  _ImeiState createState() => _ImeiState(); 
}
class _ImeiState extends State<Imei> {

  String imei;
  String _platformImei = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

    // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformImei;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei = await ImeiPlugin.getImei( shouldShowRequestPermissionRationale: false );
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

     setState(() {
      _platformImei = platformImei;
    });
  }

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


  
@override

  Widget build(BuildContext context) {

    
    return new Scaffold (appBar: new AppBar(
      title: Text('Toma de datos del dispositivo'),
    ),
        body:  Center(
          child: Text('Running on: $_platformImei\n'),
      
          
        //   child: new Column( 
          
        //   mainAxisAlignment: MainAxisAlignment.center,
     
        //   children: <Widget>[
            
        //   new RaisedButton(onPressed: getDeviceInfo, child: new Text("Get info")),
        //   new Text('ID:'),
        //   new Text(info),
        //   new Text(''),
        //   new Text('Marca:'),
        //   new Text(info5),
        //   new Text(''),
        //   new Text('Número de modelo:'),
        //   new Text(info13),
         
         
        // ],),
        
      )
    );
  }
}