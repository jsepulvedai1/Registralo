import 'package:Registralo/src/pages/state_model.dart';

class Repository {
  // http://locationsng-api.herokuapp.com/api/v1/lgas
  // test() => _nigeria.map((map) => StateModel.fromJson(map));
  List<Map> getAll() => _nigeria;

  getLocalByState(String state) => _nigeria
      .map((map) => StateModel.fromJson(map))
      .where((item) => item.state == state)
      .map((item) => item.lgas)
      .expand((i) => i)
      .toList();
  // _nigeria.where((list) => list['state'] == state);
  // .map((item) => item['lgas'])
  // .expand((i) => i)
  // .toList();

  List<String> getStates() => _nigeria
      .map((map) => StateModel.fromJson(map))
      .map((item) => item.state)
      .toList();
  // _nigeria.map((item) => item['state'].toString()).toList();

  List _nigeria = [
    {
      "state": "Bicicletas",
      "alias": "bicicletas",
      "lgas": [
        "Altitude",
        "Belda",
        "Bessati",
        "Bianchi",
        "Bmc",
        "Cannondale",
        "Celt",
        "Cervelo",
      
       
      ]
      
    },
    {
      "state": "Camara de Videos",
      "alias": "camara de videos",
      "lgas": [
        "Genius",
        "Go pro",
        "Panasonic",
        "Samsung",
        "Sony",
        
        
      ]
    },
     {
      "state": "Camara Fotograficas",
      "alias": "camara de fotograficas",
      "lgas": [
        "Canon",
        "CONTROLADOR DE FLASH GODOX XPRO",
        "FLASH GODOX V860 IIN",
        "Fujifilm",
        "LENTE 18-55MM AF-P DX VR",
        "LENTE NIKON 18-140MM DX VR",
        "LENTE NIKON 28-300MM F/3.5-5.6G ED VR",
        "LENTE NIKON 35MM AF-S 1,8G",
        "Samsung",
        "Sony",
        
        
      ]
    },
    {
      "state": "Computadores de Escitorio",
      "alias": "computadores",
      "lgas": [
        "Acer",
        "Apple",
        "Asus",
        "Compaq",
        "Dell",
        "Emachines",
        "Hp",
        "Lenovo",
        "Olidata",
        "Samsung",
        "Sony",
        
      ]
    },
     {
      "state": "Computadores Portatiles",
      "alias": "computadores portatiles",
      "lgas": [
        "Acer",
        "Apple",
        "Asus",
        "Compaq",
        "Dell",
        "Emachines",
        "Hp",
        "Lenovo",
        "Olidata",
        "Samsung",
        "Sony",
        
      ]
    },
    {
      "state": "Consola de juegos",
      "alias": "consolas",
      "lgas": [
        "Microsoft (Xbox)",
        "Nintendo",
        "Sony (Play Station)",
        
      ]
    },
    {
      "state": "Instrumentos Musicales",
      "alias": "instrumentos musicales",
      "lgas": [
        "Alhambra",
        "Angel",
        "Apple",
        "Behringer",
        "Bose",
        "Casio",
        
      ]
    },
    {
      "state": "Celulares",
      "alias": "celulares",
      "lgas": [
        "Samsung",
        "Apple",
        "Huawei",
        
      ]
    },
    
  ];
}
