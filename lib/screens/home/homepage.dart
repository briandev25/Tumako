import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tumako/constants/app_colors.dart';
import 'package:tumako/screens/home/widgets/profile_header.dart';
import 'package:tumako/screens/home/widgets/user_actions.dart';
import 'package:tumako/screens/home/widgets/shipment_container.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Map<String, dynamic>> shipments = [
    {
      "id": "#12345678",
      "pickup_date": "9 May 2026",
      "delivered_date": "9 May 2026",
      "pickup_location": "Kanyakumari",
      "drop_location": "Kochi",
    },
    {
      "id": "#87654321",
      "pickup_date": "10 May 2026",
      "delivered_date": "11 May 2026",
      "pickup_location": "Chennai",
      "drop_location": "Bangalore",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              SizedBox(height: 20.0),
              UserActions(),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Recent Shipment",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              Column(
                children: [
                  ...shipments.map(
                    (item) => ShipmentContainer(
                      id: item["id"],
                      pickupDate: item["pickup_date"],
                      deliveredDate: item["delivered_date"],
                      pickupLocation: item["pickup_location"],
                      dropLocation: item["drop_location"],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        color: AppColors.secondaryColor,
        child: GNav(
          gap: 8.0,
          tabBackgroundColor: Colors.grey.shade200,
          tabs: [
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.local_shipping, text: "Shipping"),

            GButton(icon: Icons.person, text: "Profile"),
            GButton(icon: Icons.wallet, text: "wallet"),
          ],
        ),
      ),
    );
  }
}
