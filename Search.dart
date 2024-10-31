import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final List<Map<String, String>> works; // List of work items

  const Search({super.key, required this.works});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: works.isEmpty
          ? const Center(child: Text('No work added yet.'))
          : ListView.builder(
              itemCount: works.length,
              itemBuilder: (context, index) {
                final work = works[index];
                return ListTile(
                  title: Text(work['title']!),
                  subtitle: Text(work['description']!),
                );
              },
            ),
    );
  }
}
