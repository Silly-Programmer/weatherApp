import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
class AdditionalInfo extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  const AdditionalInfo({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Iconify(icon, size: 40),
                  Text(label, style: TextStyle(fontFamily: 'BricolageGrotesque', fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(value)
                ],
              );
  }
}