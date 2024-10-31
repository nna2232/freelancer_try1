import 'package:flutter/material.dart';  

class NewWork extends StatefulWidget {  
  const NewWork({super.key});  

  @override  
  State<NewWork> createState() => _NewWorkState();  
}  

class _NewWorkState extends State<NewWork> {  
  final TextEditingController _controller = TextEditingController();  
  final List<String> _notifications = []; // List to store notifications  

  void _postNotification() {  
    if (_controller.text.isNotEmpty) {  
      setState(() {  
        _notifications.add(_controller.text); // Add the new notification  
        _controller.clear(); // Clear the text field after posting  
      });  
    }  
  }  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('New Work Page'),  
      ),  
      body: Padding(  
        padding: const EdgeInsets.all(16.0),  
        child: Column(  
          children: [  
            TextField(  
              controller: _controller,  
              decoration: const InputDecoration(  
                labelText: 'Enter work notification',  
                border: OutlineInputBorder(),  
              ),  
            ),  
            const SizedBox(height: 20),  
            ElevatedButton(  
              onPressed: _postNotification,  
              child: const Text('Post Notification'),  
            ),  
            const SizedBox(height: 20),  
            Expanded(  
              child: ListView.builder(  
                itemCount: _notifications.length,  
                itemBuilder: (context, index) {  
                  return ListTile(  
                    title: Text(_notifications[index]),  
                    leading: const Icon(Icons.notification_important),  
                  );  
                },  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}