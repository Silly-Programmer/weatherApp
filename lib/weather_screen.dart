import 'dart:convert';
import 'package:basics/error_box.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';
import 'package:flutter/material.dart';
import 'package:basics/main_card.dart';
import 'package:basics/hourly_forecast_card.dart';
import 'package:basics/additional_info.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:colorful_iconify_flutter/icons/fxemoji.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final String apiKey = dotenv.env['API_KEY']!;
      final String state = "Delhi";
      final String countryCode = 'in';
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$state,$countryCode&APPID=$apiKey",
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw data['message'];
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 30, fontFamily: 'BricolageGrotesque'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data"));
          }
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showErrorDialog(context, snapshot.error.toString());
            });

            return Center(child: Text("Error occurred"));
          }

          final data = snapshot.data!;
          final currentTemp = (data['list'][0]['main']['temp'] - 273.15)
              .toStringAsFixed(1);
          final currentStatus = data['list'][0]['weather'][0]['main'];

          final String currentPressure = data['list'][0]['main']['pressure']
              .toString();
          final String currentHumidity = data['list'][0]['main']['humidity']
              .toString();
          final String currentWindSpeed = data['list'][0]['wind']['speed']
              .toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainCard(
                  temp: "$currentTemp°C",
                  icon: currentStatus == 'Clouds' || currentStatus == 'Rain'
                      ? Emojione.cloud
                      : Emojione.sun,
                  status: currentStatus,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(
                    fontFamily: 'BricolageGrotesque',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 125,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final time = DateTime.parse(
                        data['list'][index + 1]['dt_txt'],
                      );
                      final tempKelvin =
                          data['list'][index + 1]['main']['temp'];
                      final tempCelsius = (tempKelvin - 273.15).toStringAsFixed(
                        1,
                      );
                      return HourlyForecast(
                        time: DateFormat.jm().format(time),
                        icon:
                            currentStatus == 'Clouds' || currentStatus == 'Rain'
                            ? Emojione.cloud
                            : Emojione.sun,
                        temperature: "$tempCelsius°C",
                      );
                    },
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfo(
                      icon: Emojione.droplet,
                      label: 'Humidity',
                      value: currentHumidity.toString(),
                    ),
                    AdditionalInfo(
                      icon: Emojione.umbrella,
                      label: 'Pressure',
                      value: currentPressure,
                    ),
                    AdditionalInfo(
                      icon: Fxemoji.cyclone,
                      label: 'Wind Speed',
                      value: currentWindSpeed,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
