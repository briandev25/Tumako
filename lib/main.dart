import 'package:flutter/material.dart';
import 'package:tumako/constants/app_colors.dart';
import 'package:tumako/screens/auth/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tumako",
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      home: Register(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Color.fromARGB(255, 246, 245, 245),
    );
  }
}
