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

  List<Map<String, String>> names = [
    {'name': 'Lofi', 'image': 'https://img.freepik.com/free-photo/illustration-anime-city_23-2151779727.jpg?uid=R193196606&ga=GA1.1.1575813669.1742909171&semt=ais_country_boost&w=740'},
    {'name': 'Hip Hop', 'image': 'https://i.imgur.com/t3fZ3I4.jpg'},
    {'name': 'Jazz', 'image': 'https://i.imgur.com/3UCsb4A.jpg'},
    {'name': 'Instrumental', 'image': 'https://i.imgur.com/tdp3Zrx.jpg'},
    {'name': 'Rock', 'image': 'https://i.imgur.com/K8l6qPm.jpg'},
    {'name': 'Pop', 'image': 'https://i.imgur.com/7b1I1lH.jpg'},
  ];

  List<Map<String, String>> recents = [
    {'name': 'Top Tamil Hits', 'image': 'https://i.imgur.com/1cWZ5PO.jpg'},
    {'name': 'ARR’s Magic', 'image': 'https://i.imgur.com/RXqMrLJ.jpg'},
    {'name': 'Playback Stars', 'image': 'https://i.imgur.com/BdU8mhK.jpg'},
    {'name': 'Chinmayi Hits', 'image': 'https://i.imgur.com/3Yz7yR4.jpg'},
    {'name': 'Sea Shanties', 'image': 'https://i.imgur.com/UHPcTKC.jpg'},
    {'name': 'Workout Pump', 'image': 'https://i.imgur.com/BPZ6Srh.jpg'},
  ];

  List<Map<String, String>> artists = [
    {'name': 'AR Rahman', 'image': 'https://i.imgur.com/xWcGmuw.jpg'},
    {'name': 'Anirudh', 'image': 'https://i.imgur.com/A1i6uI5.jpg'},
    {'name': 'Harris Jayaraj', 'image': 'https://i.imgur.com/k7NdWMR.jpg'},
    {'name': 'Maroon 5', 'image': 'https://i.imgur.com/K23Aqlu.jpg'},
    {'name': 'Justin P.', 'image': 'https://i.imgur.com/NWX3rHK.jpg'},
    {'name': 'G.V. Prakash', 'image': 'https://i.imgur.com/HgSXiZQ.jpg'},
  ];

  List<Map<String, String>> explore = [
    {'name': 'Indies', 'image': 'https://i.imgur.com/y0BhUbR.jpg'},
    {'name': 'Folk', 'image': 'https://i.imgur.com/OHY7EZM.jpg'},
    {'name': 'EDM', 'image': 'https://i.imgur.com/xO5PyZz.jpg'},
    {'name': 'Acapella', 'image': 'https://i.imgur.com/9IBAEAd.jpg'},
    {'name': 'Acoustic', 'image': 'https://i.imgur.com/vUy4r1u.jpg'},
    {'name': 'Solos', 'image': 'https://i.imgur.com/2SaPbGe.jpg'},
  ];

  List<Map<String, String>> evergreen = [
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
        final data = List<Map<String, String>>.from(
          (decoded['trending'] as List).map((item) => {
                'name': item['name'].toString(),
                'image': item['image'].toString(),
              }),
        );
        setState(() {
          trending = data;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.green),
      backgroundColor: Colors.black,
      title: const Center(
        child: Text('Spotify Clone', style: TextStyle(color: Colors.green)),
      ),
      actions: const [Icon(Icons.notifications)],
    );
  }

  Widget buildDrawer() {
    return Drawer(
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
          ...[
            buildDrawerItem(Icons.home, 'Home'),
            buildDrawerItem(Icons.search, 'Search'),
            buildDrawerItem(Icons.library_music, 'Your Library'),
            const Divider(color: Colors.greenAccent),
            buildDrawerItem(Icons.person_outline, 'Profile'),
            buildDrawerItem(Icons.settings, 'Settings'),
          ],
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.green))
              : trending.isNotEmpty
                  ? buildCarouselSection("Trending Now", trending)
                  : const Text("No trending data", style: TextStyle(color: Colors.white)),
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
    );
  }

  Widget buildCarouselSection(String title, List<Map<String, String>> data) {
    return buildSectionTitle(title,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 160,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          viewportFraction: 0.6,
        ),
        items: data.map(sectionCard).toList(),
      ),
    );
  }

  Widget buildHorizontalSection(String title, List<Map<String, String>> data) {
    return buildSectionTitle(title,
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (_, i) => sectionCard(data[i]),
        ),
      ),
    );
  }

  Widget buildGridSection(String title, List<Map<String, String>> data) {
    return buildSectionTitle(title,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 4 / 1,
        children: data.map(sectionCard).toList(),
      ),
    );
  }

  Widget buildSectionTitle(String title, {required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        child,
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
