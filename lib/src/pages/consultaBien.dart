
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();
 
  final String title = "DropDown Demo";
 
  @override
  DropDownState createState() => DropDownState();
}
 
class Company {
  int id;
  String name;
 
  Company(this.id, this.name);
 
  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}

class Bici {
  int id;
  String name;
 
  Bici(this.id, this.name);
 
  static List<Bici> getBici() {
    return <Bici>[
      Bici(1, 'Bci1'),
      Bici(2, 'bov2'),
      Bici(3, 'bici3'),
      Bici(4, 'bici4'),
      Bici(5, 'bici5'),
    ];
  }
}
 
class DropDownState extends State<DropDown> {
  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  List<Bici> _bici = Bici.getBici();
  List<DropdownMenuItem<Bici>> _dropdownMenuItems2;
  Bici _selectedCompany2;
 
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    _dropdownMenuItems2 = buildDropdownMenuItems2(_bici);
    _selectedCompany2 = _dropdownMenuItems2[0].value;

    super.initState();
  }
 
  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }
 
  List<DropdownMenuItem<Bici>> buildDropdownMenuItems2(List bici) {
    List<DropdownMenuItem<Bici>> items = List();
    for (Bici bici in bici) {
      items.add(
        DropdownMenuItem(
          value: bici,
          child: Text(bici.name),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem(Company selectedCompany ) {
    setState(() {
      _selectedCompany = selectedCompany;
    

    });
  }
  onChangeDropdownItem2(Bici selectbici ) {
    setState(() {

      _selectedCompany2 = selectbici;

    });
  }
  Map<String,String>eleccion ={
    'Apple':'bici',
    'Samsung':'pera',
    'null':'dasd'
  };

  @override
  Widget build(BuildContext context) {
        
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Consultar Bien"),
            ),
            body: new Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Categoria"),
                    SizedBox(
                      height: 20.0,
                    ),
                    DropdownButton(
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Selected: ${_selectedCompany.name}'),
                    DropdownButton(
                      value: _selectedCompany2,
                      items: _dropdownMenuItems2,
                      onChanged: onChangeDropdownItem2,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text( eleccion['${_selectedCompany.name}']),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final String tabla;
  Choice({this.title, this.tabla,});
}
 
final List<Choice> choices = <Choice>[
  Choice(title: 'Apple', tabla: 'hola'),
  Choice(title: 'Samsung', tabla: 'hola'),
  
  
];