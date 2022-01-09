import 'package:diet_app/view/login/register.dart';
import 'package:diet_app/view/tabbar/drawer/abouthealme.dart';
import 'package:diet_app/view/tabbar/drink/drink.dart';
import 'package:diet_app/view/tabbar/home/food.dart';
import 'package:diet_app/view/login/login.dart';
import 'package:diet_app/view/tabbar/home/homepage.dart';
import 'package:diet_app/view/tabbar/selectpage.dart';
import 'package:diet_app/view/tabbar/tabbarnavigator.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: const Color(0xFFC8E6C9),
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const Login();
          // return const Water();
          // return const TabNavigator();
        },
      },
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}