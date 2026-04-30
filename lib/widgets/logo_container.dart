import 'package:flutter/material.dart';

class BoxLogo extends StatelessWidget {
  const BoxLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
