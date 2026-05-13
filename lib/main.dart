import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tumako/constants/app_colors.dart';
//import 'package:tumako/screens/auth/register.dart';
import 'package:tumako/screens/home/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tumako",
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
