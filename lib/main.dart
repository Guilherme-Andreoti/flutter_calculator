import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  Widget build(BuildContext context) {
    return new SplashScreen(
      
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text(
        'Bem vindo a calculadora 1.0',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20.0
        ),
      ),
      image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Calcuator()
    );
  }
}


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:Calcuator()
//     );
//   }
// }