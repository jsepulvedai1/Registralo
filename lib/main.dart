import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
// import 'package:disenos/src/pages/basico_page.dart';
// import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/SignInOne.dart';
import 'package:disenos/src/pages/basico_page.dart';


//void main() => runApp(MyApp1());
 void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp1(),
  ));
} 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'botones',
      routes: {
        'basico'  : (BuildContext context ) => TabbedAppBarDemo(),
        // 'scroll'  : (BuildContext context ) => ScrollPage(),
        'botones' : (BuildContext context ) => BotonesPage(),
        'login'  : (BuildContext context) =>   SingInOne(),
      },
    );
  }
 
}
class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      seconds: 4,
      navigateAfterSeconds: MyApp(),
      image: new Image.asset(
          'assets/loading.gif'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.white,
    );
  }
}