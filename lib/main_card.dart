import 'package:flutter/material.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:iconify_flutter/iconify_flutter.dart';


class MainCard extends StatelessWidget {
  final String temp;
  final String icon;
  final String status;
  const MainCard({
    super.key,
    required this.temp,
    required this.icon,
    required this.status
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shadowColor: Color.fromARGB(255, 32, 29, 29),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(30),bottomEnd: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(temp , style:TextStyle(fontSize: 32, fontFamily: 'BricolageGrotesque', fontWeight: FontWeight.bold)),
                       SizedBox(height: 16,),
                      Iconify(icon, size:48),
                       SizedBox(height: 16,),
                      Text(status, style:TextStyle(fontFamily: 'BricolageGrotesque', fontSize: 32, color: Colors.blue))
                    ],
                  ),
                ),
              )
            );
  }
}