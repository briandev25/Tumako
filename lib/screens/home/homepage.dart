import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tumako/constants/app_colors.dart';
import 'package:tumako/screens/home/widgets/profile_header.dart';
import 'package:tumako/screens/home/widgets/user_actions.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [ProfileHeader(), SizedBox(height: 20.0), UserActions()],
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
