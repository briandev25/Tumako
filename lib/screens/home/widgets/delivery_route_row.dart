import 'package:flutter/material.dart';

class DeliveryRouteRow extends StatelessWidget {
  final String pickupLocation;
  final String dropLocation;

  const DeliveryRouteRow({
    super.key,
    required this.pickupLocation,
    required this.dropLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Pick:", style: TextStyle(color: Colors.grey)),

        SizedBox(width: 4),

        Text(pickupLocation, style: TextStyle(fontWeight: FontWeight.w500)),
        Spacer(),

        SizedBox(width: 10),

        Icon(Icons.arrow_forward, size: 18, color: Colors.blue),

        SizedBox(width: 10),

        Spacer(),

        Text("Drop:", style: TextStyle(color: Colors.grey)),

        SizedBox(width: 4),

        Text(dropLocation, style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
