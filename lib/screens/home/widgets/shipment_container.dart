import 'package:flutter/material.dart';
import './delivery_route_row.dart';
import './details_row.dart';

class ShipmentContainer extends StatelessWidget {
  final String id;
  final String pickupDate;
  final String deliveredDate;
  final String pickupLocation;
  final String dropLocation;
  const ShipmentContainer({
    super.key,
    required this.id,
    required this.pickupDate,
    required this.deliveredDate,
    required this.pickupLocation,
    required this.dropLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id, style: TextStyle(fontSize: 20.0)),

            Row(
              children: [
                Image.asset(
                  'assets/images/delivery_truck.png',
                  fit: BoxFit.contain,
                  width: 100,
                  height: 80,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        DetailRow(title: "Pick up date", value: pickupDate),
                        DetailRow(
                          title: "Delivered date",
                          value: deliveredDate,
                        ),
                        DeliveryRouteRow(
                          pickupLocation: pickupLocation,
                          dropLocation: dropLocation,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
