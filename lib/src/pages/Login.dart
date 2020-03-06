import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:/Animation/FadeAnimation.dart';
import 'package:disenos/src/pages/Animation/FadeAnimation.dart';

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
  final response = await http.post("http://192.168.43.41//dashboard/my_site/get_data.php", body: {
    "username": user.text,
    "password": pass.text,
  });
  print("no logea");
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: FadeAnimation(1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.3, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Registralo.cl", 
                          style: TextStyle(
                          color: Colors.white, fontSize: 40, 
                          fontWeight: FontWeight.bold),),
                          
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  FadeAnimation(1.8, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(0, 0, 0, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              controller: user,  
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "RUT",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
                              obscureText: true,
                              controller: pass,  
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Contraseña",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        )
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  FadeAnimation(2, Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(120, 200, 240, 1),
	                          Color.fromRGBO(120, 200, 240, .6),
	                        ]
	                      )
	                    ),
	                    child: Center(
	                            child: RaisedButton(
                          child: Text("Login"),
                            onPressed: (){
                              _login();
                            Navigator.pop(context); 
                          },
                        ),
                        
	                    ),
	                  )),
	                  SizedBox(height: 70,),
	                  FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
}





