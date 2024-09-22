import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Image with Custom Shape
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipPath(
              clipper: CustomShapeClipper(),
              child: Image.network(
                'data:image/jpeg;base64,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',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tanya Nguyen',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const Text(
            'London, UK',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.location_pin, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Hashtags/Tags Section
          Wrap(
            spacing: 10,
            children: [
              _buildTag('photography'),
              _buildTag('fashion'),
            ],
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: ''),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Tag Widget for Hashtags
  Widget _buildTag(String tagName) {
    return Chip(
      label: Text(tagName),
      backgroundColor: const Color(0xFFF1F1F1),
      labelStyle: const TextStyle(color: Colors.black54),
    );
  }
}

// Custom Shape Clipper for Profile Image
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
