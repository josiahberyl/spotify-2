import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> names = [
    'Lofi',
    'Hip Hop',
    'Jazz',
    'Instrumental',
    'Rock',
    'Pop',
  ];

  List<String> recents = [
    'Top Tamil Hits',
    'ARR’s Magic',
    'Playback Stars',
    'Chinmayi Hits',
    'Sea Shanties',
    'Workout Pump',
    'Maestro Hits',
    'VDS Soundtrack',
  ];

  List<String> artists = [
    'AR Rahman',
    'Anirudh Ravichander',
    'Harris Jayaraj',
    'Maroon 5',
    'Justin Prabhakaran',
    'G.V. Prakash',
  ];
  List<String> explore = [
    'Indies',
    'folk',
    'EDM',
    'accopella',
    'Accoustic',
    'Solos',
  ];
  List<String> evegreen = [
    '80s hits',
    '90s romance',
    'party on 80s',
    'retro Raja',
    'SPB hits',
    'Deva hits',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [Icon(Icons.notifications),],
        title: Center(
          child: const Text(
            'Spotify Clone',
            style: TextStyle(color: Colors.green),
          ),
        ),
        backgroundColor: Colors.black,
      ),
     drawer: Drawer(
  backgroundColor: Colors.black,
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
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
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home, color: Colors.white),
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        onTap: () => Navigator.pop(context),
      ),
      ListTile(
        leading: const Icon(Icons.search, color: Colors.white),
        title: const Text('Search', style: TextStyle(color: Colors.white)),
        onTap: () => Navigator.pop(context),
      ),
      ListTile(
        leading: const Icon(Icons.library_music, color: Colors.white),
        title: const Text('Your Library', style: TextStyle(color: Colors.white)),
        onTap: () => Navigator.pop(context),
      ),
      const Divider(color: Colors.greenAccent),
      ListTile(
        leading: const Icon(Icons.person_outline, color: Colors.white),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        onTap: () {
          // Navigate or do something
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings, color: Colors.white),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        onTap: () {
          // Navigate or do something
        },
      ),
    ],
  ),
),

      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Now
            const Text(
              'Trending Now',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        names[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Recents
            const SizedBox(height: 20),
            const Text(
              "Recents",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 1,
              children: List.generate(recents.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        recents[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            // Artists
            const SizedBox(height: 20),
            const Text(
              "Artists",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        artists[index],
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Explore",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        explore[index],
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Evergreen",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        evegreen[index],
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
