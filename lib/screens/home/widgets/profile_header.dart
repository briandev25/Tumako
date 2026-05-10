import 'package:flutter/material.dart';
import 'package:tumako/screens/add_shipment.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(child: Text("BK"), radius: 28.0),
          SizedBox(width: 15.0),
          Column(
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),

              Text(
                "Bryan Kiprop",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddShipment()));
            },
            icon: Icon(Icons.add, size: 35.0),
          ),
          SizedBox(width: 3.0),
          IconButton(
            onPressed: () {
              print("Notification clicked");
            },
            icon: Icon(Icons.notifications, size: 35.0),
          ),
        ],
      ),
    );
  }
}
