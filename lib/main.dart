import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:disenos/src/pages/principal.dart';
import 'package:disenos/src/pages/Login.dart';
import 'package:disenos/src/pages/post_login.dart';
import 'package:disenos/src/pages/splash2.dart';




 void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
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
      initialRoute: 'inicio',
      routes: {
        'basico'  : (BuildContext context ) => TabbedAppBarDemo(),
        // 'scroll'  : (BuildContext context ) => ScrollPage()
        'botones' : (BuildContext context ) => BotonesPage(),
        'login'  : (BuildContext context) =>   SingInOne(),
        'poslogin': (BuildContext context) =>   TabbedAppBarDemo(),
        'inicio': (BuildContext context) => MyApp1(),
      },
    );
  }
 
}

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
// class _MyAppState extends State<MyApp1> {
//   @override
//   Widget build(BuildContext context) {
//     return new SplashScreen(
//       title: new Text(
//         'Bienvenido Registralo',
//         style: new TextStyle( fontWeight: FontWeight.bold, fontSize: 20.0,),
//       ),
//       seconds: 5,
//       navigateAfterSeconds: MyApp(),
//       image: new Image.asset(
//       'assets/images_registralo.png'),

//       backgroundColor: Colors.blueAccent,
//       styleTextUnderTheLoader: new TextStyle(),
//       photoSize: 150.0,
//       onClick: () => print("Flutter Egypt"),
//       loaderColor: Colors.white,
//     );
//   }
// }






















// // class MyApp1 extends StatefulWidget {
// //   @override
// //   _MyApp1 createState() => _MyApp1();
// // }
// // class  _MyApp1 extends State<MyApp1> {
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     Timer(Duration(seconds: 3), () =>Navigator.pop(context));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         fit: StackFit.expand,
// //         children: <Widget>[
// //           Container(
// //             decoration: BoxDecoration(color: Colors.redAccent),
// //           ),
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: <Widget>[
// //               Expanded(
// //                 flex: 2,
// //                 child: Container(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       CircleAvatar(
// //                         backgroundColor: Colors.white,
// //                         radius: 50.0,
// //                         child: Icon(
// //                           Icons.shopping_cart,
// //                           color: Colors.greenAccent,
// //                           size: 50.0,
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(top: 10.0),
// //                       ),
// //                       Text(
// //                         Flutkart.name,
// //                         style: TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 24.0),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: <Widget>[
// //                     CircularProgressIndicator(),
// //                     Padding(
// //                       padding: EdgeInsets.only(top: 20.0),
// //                     ),
// //                     Text(
// //                       Flutkart.store,
// //                       softWrap: true,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 18.0,
// //                           color: Colors.white),
// //                     )
// //                   ],
// //                 ),
// //               )
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }


// // // class MyApp1 extends StatefulWidget {
// // //   @override
// // //   _MyAppState createState() => new _MyAppState();
// // // }
// // // class _MyAppState extends State<MyApp1> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return new SplashScreen(
// // //       Scaffold(
// // //       body: Stack(
// // //         fit: StackFit.expand,
// // //         children: <Widget>[
// // //           Container(
// // //             decoration: BoxDecoration(color: Colors.redAccent),
// // //           ),
// // //           Column(
// // //             mainAxisAlignment: MainAxisAlignment.start,
// // //             children: <Widget>[
// // //               Expanded(
// // //                 flex: 2,
// // //                 child: Container(
// // //                   child: Column(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: <Widget>[
// // //                       CircleAvatar(
// // //                         backgroundColor: Colors.white,
// // //                         radius: 50.0,
// // //                         child: Icon(
// // //                           Icons.shopping_cart,
// // //                           color: Colors.greenAccent,
// // //                           size: 50.0,
// // //                         ),
// // //                       ),
// // //                       Padding(
// // //                         padding: EdgeInsets.only(top: 10.0),
// // //                       ),
// // //                       Text(
// // //                         Flutkart.name,
// // //                         style: TextStyle(
// // //                             color: Colors.white,
// // //                             fontWeight: FontWeight.bold,
// // //                             fontSize: 24.0),
// // //                       )
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Expanded(
// // //                 flex: 1,
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: <Widget>[
// // //                     CircularProgressIndicator(),
// // //                     Padding(
// // //                       padding: EdgeInsets.only(top: 20.0),
// // //                     ),
// // //                     Text(
// // //                       Flutkart.store,
// // //                       softWrap: true,
// // //                       textAlign: TextAlign.center,
// // //                       style: TextStyle(
// // //                           fontWeight: FontWeight.bold,
// // //                           fontSize: 18.0,
// // //                           color: Colors.white),
// // //                     )
// // //                   ],
// // //                 ),
// // //               )
// // //             ],
// // //           )
// // //         ],
// // //       ),
// // //     ),
    
// // //     );  
// // //   }
// // }