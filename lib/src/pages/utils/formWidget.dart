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
  bool showData;

  @override
  void initState() {
    var categories = ['Autos', 'Notebooks'];

    var mapData = new Map<String, dynamic>();
    mapData['Autos'] = ['suzuki', 'kia'];
    mapData['Notebooks'] = ['hp', 'huawei'];
    showData = false;
    setState(() {
      _categories = categories;
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

  String dropdownValue = 'Autos';
  String dropDownValue2 = 'suzuki';
  Column formOneBuilder(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              width: double.infinity,
              child: Text("Cuentanos que tipo de bien deseas registrar")),
        ),
        DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          style: TextStyle(color: Colors.deepPurple),
          
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              _currentBrands = brands[newValue];
              dropDownValue2 = brands[newValue][0];
            });
          },
          items: _categories.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        DropdownButtonFormField<String>(
          value: dropDownValue2,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
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
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            width: double.infinity,
            child: Text("STEP 2"),
          ),
        ),
        TextFormField(
          controller: ctl_address,
          decoration: const InputDecoration(labelText: 'Step 2 Address'),
        ),
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
            child: (_currentBrands != null) ? this.formTwoBuilder(context) : CircularProgressIndicator(),
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