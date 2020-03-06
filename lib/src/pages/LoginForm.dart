import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';

void main() => runApp(new LoginForm());

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(),
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController3 = TextEditingController();
  TextEditingController _textFieldController4 = TextEditingController();
  
  final elements = [
    "Seleccione...",
    "Activación de cuenta REGISTRALO.CL",
    "Cambio de Estado de Bien",
    "Consulta por un bien que deseo adquirir",
    "Funcionamiento del sistema REGISTRALO.CL",
    "Ingreso a cuenta de sistema",
    "Inscripción de un bien con marca de no registrada de una categoría de la lista",
    "Inscripción en el sistema REGISTRALO.CL",
    "Recuperación clave",
    "Registro de un bien",
    "Otro asunto"
  ];
  int selectedIndex = 0;

    List<Widget> _buildItems1() {
    return elements
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }


  String _email;
  String _password;
  String _name;
  String _rut;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }



  void _onClear(){

   setState(() {
      _textFieldController.text = "";
      _textFieldController2.text = "";
      _textFieldController3.text = "";
      _textFieldController4.text = "";
    });
    
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(140, 208, 242, 1),
        key: scaffoldKey,
        
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Form(
           
            key: formKey,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _crearImagen(context),
                new TextFormField(
                  controller: _textFieldController,
                  decoration: new InputDecoration(labelText: "Nombre:", helperText: "Ejemplo: Juan Antonio Ruiz"),
            
                  onSaved: (val) => _name = val,
                ),
                new TextFormField(
                  controller: _textFieldController2,
                  decoration: new InputDecoration(labelText: "Rut:", helperText: "Ejemplo: 11.236.254-K"),
                  validator: (val) =>
                      val.length < 12 ? 'Rut too short' : null,
                  onSaved: (val) => _rut = val,
                 
                ),
                new TextFormField(
                  controller: _textFieldController3,
                  decoration: new InputDecoration(labelText: "Email:", helperText: "Ej. usuario@registralo.cl\n"),
                  validator: (val) =>
                      !val.contains('@') ? 'Invalid Email' : null,
                  onSaved: (val) => _email = val,
                ),
                //validar reingreso de email sea el mismo que el ingresado previamente
                // new TextFormField(
                //   decoration: new InputDecoration(labelText: "Email", helperText: "Ej. usuario@registralo.cl"),
                //   validator: (val) 
                //   if (!val.compareTo('_email')) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Text(
                    "Asunto",
                    style: TextStyle(
                        color: Color.fromRGBO(64, 95, 111, 1), fontWeight: FontWeight.w500),
                  ),
                ),
                DirectSelect(
                    itemExtent: 40.0,
                    selectedIndex: selectedIndex,
                    child: MySelectionItem(
                      isForList: false,
                      title: elements[selectedIndex],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    items: _buildItems1()),
            
  
                new  TextFormField(
                  controller: _textFieldController4,
                  decoration: new InputDecoration(labelText: "Mensaje:", helperText: '500 caracteres máximo',),
                  validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                maxLength: 500,
                   maxLines: 2,
               ),
             
               


       

           
                new Padding(
                //  padding: const EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(18),
                    //side: BorderSide(color: Color.fromRGBO(41, 51, 125, 1))
                    ),

                  child: Row(
                      children: <Widget>[
                        Text(
                          "Enviar",
                    style: new TextStyle(color: Colors.black),
                  ),
                        Icon(Icons.mail_outline, color: Colors.grey,),
                      ],
                    ),
          
                  color: Colors.white
,
                  onPressed: _submit,
                ),


                new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                    ),
                  child: Row(
                    children: <Widget>[
                    Text(
                    "Limpiar",
                    style: new TextStyle(color: Colors.black),
                  ),
                    Icon(Icons.help_outline, color: Colors.grey,),
                    ],
                  ),
                  color: Colors.white,
                  onPressed: _onClear,
                )
                  ],)

                


              ],
            ),
          ),
        )
        )
        );
  }
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