import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Registralo/src/pages/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'post_login.dart';

class ConsultaBienPostLogin extends StatefulWidget {
  @override
  _ConsultaBienPostLoginState createState() => _ConsultaBienPostLoginState();
}

class _ConsultaBienPostLoginState extends State<ConsultaBienPostLogin> {
  Repository repo = Repository();

  List<String> _states = ["Selcione un Categoria"];
  List<String> _lgas = ["marca .."];
  String _selectedState = "Selcione un Categoria";
  String _selectedLGA = "marca ..";
  List<String> _locations = [
    'Seleccione',
    'Compra informal',
    'Compra Tienda Retail',
    'Regalo'
  ]; // Option 2
  String _selectedLocation; // Option 2

  String _locationMessage = "";
  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
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
      backgroundColor: Color.fromRGBO(140, 208, 242, 1),

      // appBar: AppBar(
      //     flexibleSpace: Image(
      //     image: AssetImage('assets/consultaBien.png'),
      //     fit: BoxFit.contain,
      //     a

      //     ),
      //      backgroundColor: Color.fromRGBO(33, 150, 243, 1.0),

      //   title: Text("Consultar Bien"),
      //   elevation: 0.1,

      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
               _crearImagen(context),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 25),
                  child: Column(
                    children: <Widget>[
                      // _crearImagen(context),
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
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Valor Estimado'),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Numero de serie'),
                      ),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Descripción'),
                      ),

                      DropdownButton(
                        isExpanded: true,
                        hint: Text(
                            'Pocedencia del bien'), // Not necessary for Option 1
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),

                      Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            //side: BorderSide(color: Color.fromRGBO(41, 51, 125, 1))
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Guardar",
                                style: new TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          onPressed: () {
                            //var rr =_login('javier','123');

                            _getCurrentLocation();
                            _showDialog(context);
                            

                            //Navigator.pop(context);
                          },
                          
                        ),
                      ),
                      // Center(
                      //   child: RaisedButton(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(18),
                      //       //side: BorderSide(color: Color.fromRGBO(41, 51, 125, 1))
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: <Widget>[
                      //         Text(
                      //           "Registrar datos del Telefono Celular",
                      //           style: new TextStyle(color: Colors.black),
                      //         ),
                      //         Icon(
                      //           Icons.check,
                      //           color: Colors.grey,
                      //         ),
                      //       ],
                      //     ),
                      //     onPressed: () {
                      //       _getCurrentLocation();
                      //       _showDialog();
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Registralo.cl"),
          content: new Text("El bien ah sido registrado con exito"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pushNamed('basico');
                
              },
            ),
          ],
        );
      },
    );
  }

  // void _showDialog() {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         actions: <Widget>[
  //           Container(
  //             height: 400,
  //             width: 600,
  //             child: Image.asset(
  //               'assets/findID.png',
  //               fit: BoxFit.fitWidth,
  //             ),
  //           ),

  //           // usually buttons at the bottom of the dialog
  //           new FlatButton(
  //             child: new Text("Cerrar"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
 Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, 'scroll'),
        child: 
        Image.asset('assets/registrarBien.png',height: 100.0, 
          fit: BoxFit.contain,),


     
         
        ),
      );
    
  }

//  Widget _crearImagen(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: GestureDetector(
//         onTap: ()=> Navigator.pushNamed(context, 'scroll'),
//         child:
//         Image.asset('assets/consultaBien.png',height: 100.0,
//           fit: BoxFit.contain,),

//         ),
//       );

//   }

Future<List> _login(user, pass) async {
  final response = await http
      .post("http://192.168.43.41/dashboard/my_site/get_data.php", body: {
    "username": user.text,
    "password": pass.text,
  });
  var datauser = json.decode(response.body);
  print(datauser);

  return datauser;
}
