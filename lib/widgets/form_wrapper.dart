import 'package:flutter/material.dart';

class FormWrapper extends StatelessWidget {
  final Widget form;
  const FormWrapper({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: form,
      ),
    );
  }
}
