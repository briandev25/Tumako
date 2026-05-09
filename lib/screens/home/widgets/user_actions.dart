import 'package:flutter/material.dart';

List<Map<String, dynamic>> userData = [
  {"title": "Completed", "value": 7},
  {"title": "In Transit", "value": 3},
  {"title": "Delivered", "value": 15},
  {"title": "Cancelled", "value": 3},
];

class UserActions extends StatelessWidget {
  const UserActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 2.0,
          ),
          itemCount: userData.length,
          itemBuilder: (context, index) {
            final item = userData[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    item['title'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    item['value'].toString(),
                    style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
