import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Map<String, String>> trending = [];
  bool isLoading = true;

  // Static dummy data for other sections
  final List<Map<String, String>> recents = [
    {'name': 'Top Tamil Hits', 'image': 'https://i.imgur.com/1cWZ5PO.jpg'},
    {'name': 'ARR’s Magic', 'image': 'https://i.imgur.com/RXqMrLJ.jpg'},
    {'name': 'Playback Stars', 'image': 'https://i.imgur.com/BdU8mhK.jpg'},
    {'name': 'Chinmayi Hits', 'image': 'https://i.imgur.com/3Yz7yR4.jpg'},
    {'name': 'Sea Shanties', 'image': 'https://i.imgur.com/UHPcTKC.jpg'},
    {'name': 'Workout Pump', 'image': 'https://i.imgur.com/BPZ6Srh.jpg'},
  ];

  final List<Map<String, String>> artists = [
    {'name': 'AR Rahman', 'image': 'https://i.imgur.com/xWcGmuw.jpg'},
    {'name': 'Anirudh', 'image': 'https://i.imgur.com/A1i6uI5.jpg'},
    {'name': 'Harris Jayaraj', 'image': 'https://i.imgur.com/k7NdWMR.jpg'},
    {'name': 'Maroon 5', 'image': 'https://i.imgur.com/K23Aqlu.jpg'},
    {'name': 'Justin P.', 'image': 'https://i.imgur.com/NWX3rHK.jpg'},
    {'name': 'G.V. Prakash', 'image': 'https://i.imgur.com/HgSXiZQ.jpg'},
  ];

  final List<Map<String, String>> explore = [
    {'name': 'Indies', 'image': 'https://i.imgur.com/y0BhUbR.jpg'},
    {'name': 'Folk', 'image': 'https://i.imgur.com/OHY7EZM.jpg'},
    {'name': 'EDM', 'image': 'https://i.imgur.com/xO5PyZz.jpg'},
    {'name': 'Acapella', 'image': 'https://i.imgur.com/9IBAEAd.jpg'},
    {'name': 'Acoustic', 'image': 'https://i.imgur.com/vUy4r1u.jpg'},
    {'name': 'Solos', 'image': 'https://i.imgur.com/2SaPbGe.jpg'},
  ];

  final List<Map<String, String>> evergreen = [
    {'name': '80s hits', 'image': 'https://i.imgur.com/EsDOfmZ.jpg'},
    {'name': '90s romance', 'image': 'https://i.imgur.com/hN2GUwz.jpg'},
    {'name': 'Party on 80s', 'image': 'https://i.imgur.com/bmivdpW.jpg'},
    {'name': 'Retro Raja', 'image': 'https://i.imgur.com/Bxyvl47.jpg'},
    {'name': 'SPB Hits', 'image': 'https://i.imgur.com/Eze4PIY.jpg'},
    {'name': 'Deva Hits', 'image': 'https://i.imgur.com/HrTh5TJ.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    fetchTrendingData();
  }

  Future<void> fetchTrendingData() async {
  final url = Uri.parse('https://mocki.io/v1/2f861cd4-f416-4375-8fd2-c9feaff7f68c');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      final List<Map<String, String>> trendingData = (decoded['trending'] as List)
          .map((item) => {
                'name': item['name'].toString(),
                'image': item['image'].toString(),
              })
          .toList();

      setState(() {
        trending = trendingData;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to fetch trending data');
    }
  } catch (e) {
    print('Error fetching trending data: $e');
    setState(() => isLoading = false);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('Spotify Clone', style: TextStyle(color: Colors.green)),
        ),
        actions: const [Icon(Icons.notifications)],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, size: 35, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hello, User!',
                    style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            drawerItem(Icons.home, 'Home'),
            drawerItem(Icons.search, 'Search'),
            drawerItem(Icons.library_music, 'Your Library'),
            const Divider(color: Colors.greenAccent),
            drawerItem(Icons.person_outline, 'Profile'),
            drawerItem(Icons.settings, 'Settings'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading
                ? const Center(child: CircularProgressIndicator(color: Colors.green))
                : trending.isNotEmpty
                    ? buildCarouselSection("Trending Now", trending)
                    : const Text("No trending data found", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            buildGridSection("Recents", recents),
            const SizedBox(height: 20),
            buildHorizontalSection("Artists", artists),
            const SizedBox(height: 20),
            buildHorizontalSection("Explore", explore),
            const SizedBox(height: 20),
            buildHorizontalSection("Evergreen", evergreen),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget buildCarouselSection(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 160,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: 0.6,
          ),
          items: data.map((item) => sectionCard(item)).toList(),
        ),
      ],
    );
  }

  Widget buildHorizontalSection(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return sectionCard(data[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildGridSection(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 1,
          children: data.map((item) => sectionCard(item)).toList(),
        ),
      ],
    );
  }

  Widget sectionCard(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on ${item['name']}')),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(item['image']!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(
          item['name']!,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
