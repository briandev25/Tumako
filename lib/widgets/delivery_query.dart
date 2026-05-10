import 'package:flutter/material.dart';

class DeliveryQuery extends StatelessWidget {
  final String query;
  const DeliveryQuery({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Text(
      query,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
