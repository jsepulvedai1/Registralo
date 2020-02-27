import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:disenos/src/pages/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository repo = Repository();

  List<String> _states = ["Selcione un Categoria"];
  List<String> _lgas = ["marca .."];
  String _selectedState = "Selcione un Categoria";
  String _selectedLGA = "marca ..";

  String _locationMessage = ""; 
  void _getCurrentLocation() async {
    print('saa');
   final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('3333');  
    print(position);
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
      print(_locationMessage);
      print('----');
    });
  }

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar Bien"),
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              
            children: <Widget>[
              DropdownButton<String>(
                isExpanded: true,
                items: _states.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedState(value),
                value: _selectedState,
              ),
              DropdownButton<String>(
                isExpanded: true,
                items: _lgas.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                  
                }).toList(),
                // onChanged: (value) => print(value),
                onChanged: (value) => _onSelectedLGA(value),
                value: _selectedLGA,
               
              ),
              
              Center(
                  child: RaisedButton(
                    child: Text('Consultar'),

                      onPressed: (){
                          //var rr =_login('javier','123');
                          print('ksakk');
                          _getCurrentLocation();
                          
                          
                      //Navigator.pop(context); 
                    },
                    
                    
                          
                        ),
                        

                        
                        
            
              )
              
            ],
            
          ),
          
        ),
      ),
    );
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedLGA = "Choose ..";
      _lgas = ["Choose .."];
      _selectedState = value;
      _lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
  }
}

Future<List> _login(user,pass) async {
  final response = await http.post("http://192.168.43.41/dashboard/my_site/get_data.php", body: {
   "username": user.text,
   "password": pass.text,
  });
  var datauser = json.decode(response.body);
  print(datauser);

  return datauser;
}

