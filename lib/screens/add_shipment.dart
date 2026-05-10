import 'package:flutter/material.dart';
import '../widgets/delivery_choice.dart';
import '../widgets/delivery_query.dart';

List<Map<String, dynamic>> delivery = [
  {
    "query": "phase",
    "hint": "Select construction phase",
    "choices": [
      "Foundation",
      "Walling",
      "Finishing",
      "Roofing",
      "Plumbing",
      "Electrical",
      "Landscaping",
    ],
  },
  {
    "query": "Material Type",
    "hint": "Select material type",
    "choices": [
      "Cement",
      "Sand",
      "Ballast",
      "Steel",
      "Bricks",
      "Timber",
      "Tiles",
      "Equipments",
    ],
  },
  {
    "query": "Quantity Type",
    "hint": "Select quantity type",
    "choices": ["Per bag", "Per Tonne", "Per Trackload", "Per piece"],
  },
  {
    "query": "Vehicle Type",
    "hint": "Select vehicle type",
    "choices": ["PickUp", "Lorry", "Crane Truck", "Tipper", "Crane Truck"],
  },
];

class AddShipment extends StatefulWidget {
  const AddShipment({super.key});

  @override
  State<AddShipment> createState() => _AddShipmentState();
}

class _AddShipmentState extends State<AddShipment> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2026),
    );
    if (datePicked != null) {
      setState(() {
        _selectedDate = datePicked;
        print("Selected date: $_selectedDate");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ...delivery.map(
                    (item) => DeliveryChoice(
                      query: item["query"],
                      choices: item["choices"],
                      hintText: item["hint"],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeliveryQuery(query: "Quantity"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter quantity",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      DeliveryQuery(query: "Schedule Date"),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Select schedule date",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: _pickDate,
                      ),
                      SizedBox(height: 25.0),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 35.0,
                              vertical: 10.0,
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Next", style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
