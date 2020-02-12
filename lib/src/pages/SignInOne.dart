
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String username='';
class SingInOne extends StatefulWidget {


  @override
  _SingInOne createState(){
    return new _SingInOne();
  }
}

class _SingInOne extends State<SingInOne> {

TextEditingController user=new TextEditingController();
TextEditingController pass=new TextEditingController();

String msg='';

Future<List> _login() async {
  final response = await http.post("http://192.168.93.113//dashboard/my_site/get_data.php", body: {
    "username": user.text,
    "password": pass.text,
  });
  print(response.body.toString());
  var datauser = json.decode(response.body);
  print(datauser);
  if(datauser.length==0){
    setState(() {
          msg="Login Fail";
        });
  }else{
    if(datauser[0]['nivel']=='super'){
       Navigator.pushNamed(context,'basico');
       print('super..');
    }else if(datauser[0]['nivel']=='bodega'){
      print('bodegaaa');
      Navigator.pushNamed(context, 'basico');
    }

    setState(() {
          username= datauser[0]['username'];
        });

  }

  return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: user,                
                decoration: InputDecoration(
                  hintText: 'Username'
                ),           
                ),
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Password'
                ),                
                ),
              
              RaisedButton(
                child: Text("Login"),
                onPressed: (){
                  _login();
                  Navigator.pop(context); 
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
             

            ],
          ),
        ),
      ),
    );
}
}