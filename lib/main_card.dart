import 'package:flutter/material.dart';


class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shadowColor: Color.fromARGB(255, 32, 29, 29),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(30),bottomEnd: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("300K", style:TextStyle(fontSize: 32, fontFamily: 'BricolageGrotesque', fontWeight: FontWeight.bold)),
                       SizedBox(height: 16,),
                      Icon(Icons.cloud, size: 48,),
                       SizedBox(height: 16,),
                      Text("Rain", style:TextStyle(fontFamily: 'BricolageGrotesque', fontSize: 32))
                    ],
                  ),
                ),
              )
            );
  }
}