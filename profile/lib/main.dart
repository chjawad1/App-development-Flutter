import 'package:flutter/material.dart';

void main() => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String name = 'Muhammad Abdullah';
  final String email = 'abdullahwale@gmail.com';
  final String phone = '+923046983794';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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',
              ),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              phone,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
