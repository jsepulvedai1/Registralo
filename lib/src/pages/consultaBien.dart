import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:disenos/src/pages/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


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

  Map<String,double> currentLocation = new Map();
  StreamSubscription<Map<String,double>> locationSubscription;

  Location location = new Location();
  String error;
    
    
      @override
      void initState() {
        _states = List.from(_states)..addAll(repo.getStates());
        super.initState();

        //Default variables set is 0
        currentLocation['latitude'] = 0.0;
        currentLocation['longitude'] = 0.0;

         initPlatformState();
          locationSubscription = location.onLocationChanged.listen((Map<String,double> result){
            setState(() {
             currentLocation = result; 
            });  
          });
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
                              child: Text("Consultar"),
    
                                onPressed: (){
                                   var rr =_login('javier','123');
                                //Navigator.pop(context); 

                                Text('Lat/Lng:${currentLocation['latitude']}/${currentLocation['longitude']}',style: 
                                
                                TextStyle(fontSize: 20.0, color: Colors.blueAccent),);
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
    
      void initPlatformState() async {
        Map<String,double> my_location;
        try{
          my_location = await location.getLocation;
          error="";
        }on PlatformException catch(e){
          if(e.code == 'PERMISSION_DENIED')
            error = 'Permission denied';
          else if(e.code == 'PERMISSION_DENIED_NEVER_ASK')
            error = 'Permission denied - please ask the user to enable it from the app settings';
          my_location = null;
        }

        setState(() {
          currentLocation = my_location;
        });

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

