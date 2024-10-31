import 'package:flutter/material.dart';  

class Chats extends StatefulWidget {  
  const Chats({super.key});  

  @override  
  State<Chats> createState() => _ChatsState();  
}  

class _ChatsState extends State<Chats> {  
  final TextEditingController _controller = TextEditingController();  
  final List<String> _messages = []; // List to hold the chat messages  

  void _sendMessage() {  
    if (_controller.text.isNotEmpty) {  
      setState(() {  
        // Add the message to the list  
        _messages.add(_controller.text);  
        // Clear the text field after sending  
        _controller.clear();  
      });  
    }  
  }  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Chat Page'),  
      ),  
      body: Column(  
        children: [  
          Expanded(  
            child: ListView.builder(  
              itemCount: _messages.length,  
              itemBuilder: (context, index) {  
                return ListTile(  
                  title: Text(_messages[index]),  
                  // You can customize the appearance of the messages here  
                );  
              },  
            ),  
          ),  
          Padding(  
            padding: const EdgeInsets.all(8.0),  
            child: Row(  
              children: [  
                Expanded(  
                  child: TextField(  
                    controller: _controller,  
                    decoration: const InputDecoration(  
                      hintText: 'Type your message',  
                      border: OutlineInputBorder(),  
                    ),  
                  ),  
                ),  
                IconButton(  
                  icon: const Icon(Icons.send),  
                  onPressed: _sendMessage,  
                ),  
              ],  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}