import 'package:flutter/material.dart';
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
    );
  }
}
