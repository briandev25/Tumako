import 'package:flutter/material.dart';
import '../widgets/delivery_query.dart';

class DeliveryChoice extends StatelessWidget {
  final String query;
  final List<String> choices;
  final String hintText;
  final Function(String?)? onChanged;
  const DeliveryChoice({
    super.key,
    required this.query,
    required this.choices,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeliveryQuery(query: query),
        SizedBox(height: 5.0),
        DropdownButtonFormField(
          hint: Text(hintText),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          items: choices
              .map(
                (choice) =>
                    DropdownMenuItem(value: choice, child: Text(choice)),
              )
              .toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an option';
            }
            return null;
          },
          onChanged: onChanged,
        ),
        SizedBox(height: 25.0),
      ],
    );
  }
}
