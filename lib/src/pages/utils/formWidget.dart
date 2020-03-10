import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  //final _formKey = GlobalKey();
  int _stepNumber = 1;

  final ctl_name = TextEditingController();
  final ctl_age = TextEditingController();
  final ctl_address = TextEditingController();
  final ctl_city = TextEditingController();
  List<String> _categories;
  Map<String, dynamic> brands;
  List<String> _currentBrands;
  List<String> _estimatedValues;
  Map<String, List<String>> _identifiers;
  Map<String, String> currentIdentifiers;
  String estimatedValue;
  bool showData;
  bool checkBoxBrand;
  bool showInputs;
  @override
  void initState() {
    var categories = ['Autos', 'Notebooks'];
    checkBoxBrand = false;
    showInputs = false;
    var mapData = new Map<String, dynamic>();
    var mapIdentifiers = new Map<String, List<String>>();
    mapIdentifiers['Autos'] = ['Patente', 'Kilometraje'];
    mapIdentifiers['Notebooks'] = ['MAC', 'procesador'];
    mapData['Autos'] = ['suzuki', 'kia'];
    mapData['Notebooks'] = ['hp', 'huawei'];
    var estimatedValues = [
      "Menor a \$100.000",
      "\$100.000 - \$500.000",
      "\$500.000 - \$100.0000",
      "\$Superior a \$1000.000"
    ];
    showData = false;
    setState(() {
      _identifiers = mapIdentifiers;

      _categories = categories;
      _estimatedValues = estimatedValues;
      estimatedValue = estimatedValues[0];
      brands = mapData;
      _currentBrands = ['suzuki', 'kia'];
      showData = true;
    });
    super.initState();
  }

  void saveData(BuildContext context) {
    //this._formKey.currentState.save();

    print(ctl_name.text);
    print(ctl_age.text);
    print(ctl_address.text);
    print(ctl_city.text);
  }

  void nextPage(BuildContext context) {
    setState(() {
      if (_stepNumber == 1)
        _stepNumber = 2;
      else
        _stepNumber = 1;
    });
  }

  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            checkBoxBrand = value;
            setState(() {
              checkBoxBrand = value;
            });
          },
        )
      ],
    );
  }
  //List _listings = new List();

  List<Widget> _getInputs(BuildContext context) {
    List inputs = new List<Widget>();
    List listings = _getListings(context, currentCategory);
    if (showInputs) {
      inputs.add(Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text("Marca"),
      Expanded(child: checkbox("Nuevo", checkBoxBrand)),
      Expanded(
          child: DropdownButtonFormField<String>(
        value: dropDownValue2,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (String newValue) {
          setState(() {
            dropDownValue2 = newValue;
          });
        },
        items: _currentBrands.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ))
    ]));
    inputs.add(Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Expanded(
        child: Text("Valor estimado"),
      ),
      Expanded(
          child: DropdownButton<String>(
        value: estimatedValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            estimatedValue = newValue;
          });
        },
        items: _estimatedValues.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ))
    ]));
    inputs.add( ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 1000),
      child: ListView(
        children: listings,
      )) 
    );
    } else {
      inputs.add(Text("Seleccione una categoría para más opciones"));
    }
    return inputs;
  }

  List<Widget> _getListings(BuildContext context, String category) {
    // <<<<< Note this change for the return type
    List listings = new List<Widget>();
    if (showInputs) {

      int i = 0;
      int lenght = _identifiers[category].length;
      for (i = 0; i < lenght; i++) {
        var text = _identifiers[category][i];
        listings.add(new Row(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
            Expanded(
              child: Text(text),
            ),
            Expanded(
                child: TextFormField(
              controller: ctl_address,
              decoration: const InputDecoration(labelText: 'Ingrese valores'),
            ))
          ])
        );
      }
    }
    return listings;
  }

  String currentCategory = 'Autos';
  String dropDownValue2 = 'suzuki';
  Column formOneBuilder(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              width: double.infinity,
              child: Text("Cuentanos que tipo de bien deseas registrar")),
        ),
        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Expanded(
            child: Text("Categoría"),
          ),
          Expanded(
              child: DropdownButton<String>(
            value: currentCategory,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                currentCategory = newValue;
                _currentBrands = brands[newValue];
                dropDownValue2 = brands[newValue][0];
                showInputs = true;
              });
            },
            items: _categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ))
        ]),
        Expanded(child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: _getInputs(context)
          )),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  child: Text('Next'),
                  onPressed: () {
                    nextPage(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                FlatButton(
                  color: Colors.blue,
                  child: Text('Save'),
                  onPressed: () {
                    saveData(context);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column formTwoBuilder(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            width: double.infinity,
            child: Text("Agrega más información de tu bien"),
          ),
        ),
        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Expanded(
            child: Text("Selecciona algo"),
          ),
          Expanded(
              child: TextFormField(
            controller: ctl_address,
            decoration: const InputDecoration(labelText: 'Step 2 Address'),
          ))
        ]),
        TextFormField(
          controller: ctl_city,
          decoration: const InputDecoration(labelText: 'Step 2 City'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  child: Text('Previous'),
                  onPressed: () {
                    nextPage(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                FlatButton(
                  color: Colors.blue,
                  child: Text('Save'),
                  onPressed: () {
                    saveData(context);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showData) {
      switch (_stepNumber) {
        case 1:
          return Form(
              child: (_categories != null)
                  ? this.formOneBuilder(context)
                  : CircularProgressIndicator());
          break;

        case 2:
          return Form(
            child: (_currentBrands != null)
                ? this.formTwoBuilder(context)
                : CircularProgressIndicator(),
          );
          break;
      }
    } else {
      print("hola");
    }
  }

  void dispose() {
    ctl_address.dispose();
    ctl_age.dispose();
    ctl_city.dispose();
    ctl_name.dispose();

    super.dispose();
  }
}

class RowFormBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RowFormBuilderState();

  RowFormBuilder({this.categories});
  final List<String> categories;
}

class RowFormBuilderState extends State<RowFormBuilder> {
  @override
  Widget build(BuildContext context) {
    String firstCategory = widget.categories[0];
    return Row(
      children: <Widget>[
        DropdownButton<String>(
          value: firstCategory,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          style: TextStyle(color: Colors.deepPurple),
          onChanged: (String newValue) {
            setState(() {
              firstCategory = newValue;
            });
          },
          items:
              widget.categories.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
