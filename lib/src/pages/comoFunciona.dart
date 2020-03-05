import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class ComoFunciona extends StatelessWidget{
  final estiloTitulo    = TextStyle( color: Color.fromRGBO(255, 255, 0, 1),fontSize: 20.0, fontWeight: FontWeight.bold, backgroundColor: Color.fromRGBO(41, 51, 125, 1), );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(context),
            _crearTitulo(),
       
            _crearTexto(),
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
        child: Image(
          image: NetworkImage('https://registralo.spd.gov.cl//images/img_comofunciona.png'),
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/comoFunciona.png'),
                  SizedBox( height: 7.0 ),
           
                ],
              ),
            ),
       
          ],
        ),
      ),
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'Registralo es una iniciativa de la Subsecretaría de Prevención del Delito, supervisada por el Centro de Estudios y Análisis del Delito (CEAD), enmarcada dentro de las iniciativas relacionadas con la prevención de los mercados de bienes robados en Chile.\n\nRegistralo.cl puede utilizarse como usuario sólo de consulta, para lo cual, en la barra de herramientas se debe escoger Consulta Bien, seleccionando una Categoría y Marca y completando los datos de identificación del bien que deseas consultar. \n\nPara registrar bienes y consultar mayor detalle de bienes registrados en el sistema, debes inscribirte, completando en el icono REGISTRATE, los datos que te identifiquen como usuario de registralo.cl Al acceder a tu cuenta de usuario, se despliega una barra de herramientas donde podrás Registrar y Consultar Bienes, además de un inventario de tus bienes registrados y un módulo que contiene los Datos de tu información personal y de contacto.\n\nAl registrar tus bienes, y en el caso de su robo o extravío, registralo.cl facilitará la identificación y el contacto a los legítimos dueños de los bienes hallados en procedimiento de la Policía de Investigaciones o Carabineros de Chile y favorecerá su devolución.\n\n\n',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}