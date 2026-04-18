import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class HourlyForecast extends StatelessWidget {
  final String time;
  final String icon;
  final String temperature;
  const HourlyForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.directional(topEnd: Radius.circular(20), bottomStart: Radius.circular(20))),
      elevation: 10,
      shadowColor: Color.fromARGB(255, 32, 29, 29),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(
                fontFamily: 'BricolageGrotesque',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Iconify(Emojione.sun),
            const SizedBox(height: 10),
            Text(
              temperature,
              style: TextStyle(fontFamily: 'BricolageGrotesque', fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
