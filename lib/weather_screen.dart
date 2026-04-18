import 'package:flutter/material.dart';
import 'package:basics/main_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'BricolageGrotesque'
          ),
        ),
        actions: [
          IconButton(icon:Icon(Icons.refresh), onPressed: () {},)
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MainCard(),
            const SizedBox(height: 20,),
            SizedBox(
              height: 150,
            child: Placeholder()),
            const SizedBox(height: 20,),
            SizedBox(
              height: 150,
            child: Placeholder()),
          ],
        ),
      )
    );
  }
}