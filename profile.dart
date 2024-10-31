import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage:NetworkImage("data:image/png;base64,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"), // Use an image asset here
            ),
            const SizedBox(height: 16),
            
            // Name
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Bio
            const Text(
              'Freelance Developer | Flutter Enthusiast | Tech Blogger',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            
            // Profile Stats
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('120', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Projects'),
                  ],
                ),
                Column(
                  children: [
                    Text('350', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text('180', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Following'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Profile Settings Buttons
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Edit Profile'),
                    onTap: () {
                      // Navigate to Edit Profile Screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Privacy Settings'),
                    onTap: () {
                      // Navigate to Privacy Settings Screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notifications'),
                    onTap: () {
                      // Navigate to Notifications Settings Screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Support'),
                    onTap: () {
                      // Navigate to Help & Support Screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      // Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
