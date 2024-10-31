import 'package:flutter/material.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  // Example list of business items
  final List<Map<String, String>> _businessItems = [
    {"name": "Marketing Strategies", "description": "Learn effective marketing"},
    {"name": "Financial Planning", "description": "Plan your finances better"},
    {"name": "Team Management", "description": "Manage teams efficiently"},
    {"name": "Sales Techniques", "description": "Improve your sales skills"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Page'),
      ),
      body: ListView.builder(
        itemCount: _businessItems.length,
        itemBuilder: (context, index) {
          final item = _businessItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: const Icon(Icons.business_center, color: Colors.blue),
              title: Text(item["name"] ?? "Business Item"),
              subtitle: Text(item["description"] ?? "Description not available"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate or perform actions on tap
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(item["name"]!),
                      content: Text(item["description"]!),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
