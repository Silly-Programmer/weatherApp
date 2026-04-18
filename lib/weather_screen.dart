import 'package:flutter/material.dart';
import 'package:basics/main_card.dart';
import 'package:basics/hourly_forecast_card.dart';
import 'package:basics/additional_info.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:colorful_iconify_flutter/icons/fxemoji.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});
  
  Future getCurrentWeather() async{
    final String apiKey = dotenv.env['API_KEY']!;
    await http.get(
      Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=$apiKey"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 30, fontFamily: 'BricolageGrotesque'),
        ),
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainCard(),
            const SizedBox(height: 20),
            const Text(
              'Hourly Forecast',
              style: TextStyle(
                fontFamily: 'BricolageGrotesque',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(
                    time: "20:00",
                    temperature: "420K",
                    icon: Emojione.sun,
                  ),
                  HourlyForecast(
                    time: "23:00",
                    temperature: "400K",
                    icon: Emojione.cloud_with_rain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Additional Information",
              style: TextStyle(
                fontFamily: 'BricolageGrotesque',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  icon: Emojione.droplet,
                  label: 'Humidity',
                  value: '100',
                ),
                AdditionalInfo(
                  icon: Emojione.umbrella,
                  label: 'Pressure',
                  value: '100',
                ),
                AdditionalInfo(
                  icon: Fxemoji.cyclone,
                  label: 'Wind Speed',
                  value: '100',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
