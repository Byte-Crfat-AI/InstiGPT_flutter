import 'package:flutter/material.dart';
import 'package:instigpt/Pages/Dark.dart';
import 'package:instigpt/Pages/Light.dart';
import 'package:instigpt/Pages/profile.dart'; // Import your profile page

void main() => runApp(ChatBotApp());

class ChatBotApp extends StatefulWidget {
  @override
  _ChatBotAppState createState() => _ChatBotAppState();
}

class _ChatBotAppState extends State<ChatBotApp> {
  bool isDarkMode = false; // Default to light mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(), // Apply theme
      home: Scaffold(
        appBar: AppBar(
          title:Row(
          children: [
            Image.asset( isDarkMode ?'lib/assets/logo_white_grouped.png':'lib/assets/AIC_logo_no_background.png', height: isDarkMode ? 40: 50), // Add logo to app bar
            SizedBox(width: 10),
            Text('InstiGPT'),
          ], // Add logo to app bar
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to profile page
                );
              },
            ),
          ],
        ),
        body: isDarkMode ? DarkPage() : LightPage(), // Switch between Dark and Light pages
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode; // Toggle mode on click
            });
          },
          child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode), // Toggle icon based on mode
        ),
      ),
    );
  }
}
