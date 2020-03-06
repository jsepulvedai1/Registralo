import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:direct_select/direct_select.dart';


class Contacto extends StatefulWidget{

  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {

  final estiloTitulo    = TextStyle( color: Color.fromRGBO(255, 255, 0, 1),fontSize: 20.0, fontWeight: FontWeight.bold, backgroundColor: Color.fromRGBO(41, 51, 125, 1), );
  final _formKey = GlobalKey<FormState>();
   final elements1 = [
    "Breakfast",
    "Lunch",
    "2nd Snack",
    "Dinner",
    "3rd Snack",
  ];
  int selectedIndex1 = 0;
   List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(context),
            _crearTitulo(),
            
            _formulario(),
            //  DirectSelect(
            //         itemExtent: 35.0,
            //         selectedIndex: selectedIndex1,
            //         child: MySelectionItem(
            //           isForList: false,
            //           title: elements1[selectedIndex1],
            //         ),
            //         onSelectedItemChanged: (index) {
            //           setState(() {
            //             selectedIndex1 = index;
            //           });
            //         },
            //         items: _buildItems1()),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            //       child: Text(
            //         "Search our database by name",
            //         style: TextStyle(
            //             color: Colors.grey, fontWeight: FontWeight.w500),
            //       ),
            //     ),
          ],
        ),
      )
    );
  }
  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, 'scroll'),
        child: 
        Image.asset('assets/contacto.png',height: 100.0, 
          fit: BoxFit.contain,),


     
         
        ),
      );
    
  }
  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
       
        color: Color.fromRGBO(0, 0, 255, 0),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
   
      ),
    );
  }

    Widget _formulario(){
      
      return Form(
      key: _formKey,
      child: Column(

        
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nombre',
              
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
          decoration: const InputDecoration(
            hintText: 'Rut',
            
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),

        TextFormField(
        decoration: const InputDecoration(
          hintText: 'Email',
          
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
          TextFormField(
          decoration: const InputDecoration(
            hintText: 'Reingresar email',
            
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
  
          TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(
            hintText: 'Mensaje',
          

            
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
  );
  }
}
class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}