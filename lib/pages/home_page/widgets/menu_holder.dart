import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final String subTitle; 

  const MenuItem({super.key, required this.icon, required this.title, required this.color, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color),
      height: 184,
      width: 152,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(subTitle),
          ],
        ),
      ),
    );
  }
}
