import 'package:flutter/material.dart';
import 'package:tumako/widgets/logo_container.dart';
import '../../widgets/form_wrapper.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              BoxLogo(),
              SizedBox(height: 20),
              FormWrapper(
                form: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Register Screen")],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
