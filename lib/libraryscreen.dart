import 'package:flutter/material.dart';

class Libraryscreen extends StatefulWidget {
  const Libraryscreen({super.key});

  @override
  State<Libraryscreen> createState() => _LibraryscreenState();
}

class _LibraryscreenState extends State<Libraryscreen> {
  final List<String> playlists = [
    'Liked Songs',
    'Road Trip',
    'Workout Mix',
    'Old School',
    'Chill Vibes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Library', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: playlists.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.music_note, color: Colors.green),
              const SizedBox(width: 10),
              Text(
                playlists[index],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
