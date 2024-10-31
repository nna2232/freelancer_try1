import 'package:flutter/material.dart';

import 'package:freelancer_try1/homepage.dart';
import 'appbars/chats.dart';
import 'appbars/newwork.dart';
import 'appbars/notifications.dart';
import 'bottomnavigationbar/Add.dart';
import 'bottomnavigationbar/Business.dart';
import 'bottomnavigationbar/People.dart';
import 'bottomnavigationbar/Search.dart';
import 'bottomnavigationbar/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _works = []; // List to store works

  // Function to add work from Add page
  void _addWork(String title, String description) {
    setState(() {
      _works.add({'title': title, 'description': description});
    });
  }

  // List of pages corresponding to each BottomNavigationBar item
  List<Widget> _pages() => [
        const homepage(), // Ensure this is the correct class name
        Search(works: _works), // Pass works list to Search page
        const Business(),
        const People(),
        Add(onAddWork: _addWork), // Pass function to Add page
        const Profile(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Freelancer'),
            actions: [
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  Navigator.pushNamed(context, '/information');
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()),
                  );
                },
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewWork()),
                  );
                },
                icon: const Icon(Icons.folder_open),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chats()),
                  );
                },
                icon: const Icon(Icons.message),
              ),
            ],
          ),
          body: _pages()[_selectedIndex], // Display the selected page
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'پەڕەی سەرەکی',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'گەڕان',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: 'کارەکان',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'گروپەکانم',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'زیادکردن',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'پڕۆفایل',
                backgroundColor: Colors.amber,
              ),
            ],
          ),
        ),
        '/information': (context) => const Information(),
        '/notifications': (context) => const Notifications(), // Add route for Notifications page
     
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Information'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo
            Center(
              child: Image.network('https://logo.com/image-cdn/images/kts928pd/production/c43174cfbf41d5b0d5b19c709000a70b29294e4b-414x410.png?w=1080&q=72&fm=webp',
              scale: 0.20,
              width: 70,
              height: 50,
              ),
                
            ),
            const SizedBox(height: 20),
            
            // App Name and Version
            const Text(
              'Freelancer App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // App Description
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Freelancer App helps users manage freelance projects, search for work, and connect with professionals. This app includes a search page, profile management, and notification center to make freelancing easier and more efficient.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Features Section
            const Text(
              'Features',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const BulletPoint(text: 'Add and manage work projects'),
            const BulletPoint(text: 'Search for freelance opportunities'),
            const BulletPoint(text: 'Connect with other professionals'),
            const BulletPoint(text: 'Profile management and customization'),
            const SizedBox(height: 20),

            // Contact Information
            const Text(
              'Contact',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: support@freelancerapp.com',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Phone: +1 234 567 890',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for displaying bullet points
class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}