import 'package:flutter/material.dart';
import 'package:tumako/screens/pick_location.dart';
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

  String? phase;
  String? materialType;
  String? quantityType;
  String? vehicleType;
  int? quantity;

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
      appBar: AppBar(backgroundColor: Colors.grey[200]),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ...delivery.map(
                    (item) => DeliveryChoice(
                      query: item["query"],
                      choices: item["choices"],
                      hintText: item["hint"],
                      onChanged: (value) {
                        setState(() {
                          if (item["query"] == "Phase") {
                            phase = value;
                          } else if (item["query"] == "Material Type") {
                            materialType = value;
                          } else if (item["query"] == "Quantity Type") {
                            quantityType = value;
                          } else if (item["query"] == "Vehicle Type") {
                            vehicleType = value;
                          }
                        });
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeliveryQuery(query: "Quantity"),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter quantity",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter quantity";
                          }
                          if (int.tryParse(value) == null) {
                            return "Please enter a valid number";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            quantity = int.parse(value);
                          });
                        },
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
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await _pickDate();
                        },
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PickLocation(),
                                ),
                              );
                            }
                          },
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
