// import 'package:basics/counter.dart';
import 'package:flutter/material.dart';
import 'package:basics/weather_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(home:WeatherScreen(),
    theme: ThemeData.dark(useMaterial3: true),
    debugShowCheckedModeBanner: false,);
  }
}