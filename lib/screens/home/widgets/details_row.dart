import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  const DetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(color: Colors.grey[800], fontSize: 13.0)),
        Spacer(),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
        ),
      ],
    );
  }
}
