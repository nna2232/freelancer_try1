import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  // Example list of contacts
  final List<Map<String, String>> _contacts = [
    {"name": "John Doe", "status": "Available"},
    {"name": "Jane Smith", "status": "Busy"},
    {"name": "Alice Johnson", "status": "Offline"},
    {"name": "Bob Brown", "status": "Available"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  contact["name"]![0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(contact["name"] ?? "Contact"),
              subtitle: Text(contact["status"] ?? "Status unavailable"),
              trailing: IconButton(
                icon: const Icon(Icons.chat),
                color: Colors.green,
                onPressed: () {
                  // Show dialog or navigate to a chat screen
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Start Chat with ${contact["name"]}"),
                        content: const Text("This would open the chat screen."),
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
            ),
          );
        },
      ),
    );
  }
}
