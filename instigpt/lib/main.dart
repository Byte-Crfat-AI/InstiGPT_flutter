import 'package:flutter/material.dart';
import 'package:instigpt/Pages/Dark.dart';
import 'package:instigpt/Pages/Light.dart';
import 'package:instigpt/Pages/profile_dark.dart'; 
import 'package:instigpt/Pages/profile_light.dart';

void main() => runApp(ChatBotApp());

class ChatBotApp extends StatefulWidget {
  @override
  _ChatBotAppState createState() => _ChatBotAppState();
}

class _ChatBotAppState extends State<ChatBotApp> {
  bool isDarkMode = false; // Default to light mode
  List<String> chatHistory = [
    "Hello!",
    "How can I assist you?",
    "What is the weather today?",
  ]; //to be retrieved from the database

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                isDarkMode
                    ? 'lib/assets/logo_white_grouped.png'
                    : 'lib/assets/AIC_logo_no_background.png',
                height: isDarkMode ? 40 : 48,
              ),
              SizedBox(width: 10),
              Text(
                'InstiGPT',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            // Profile IconButton
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => isDarkMode ? ProfilePage() : LightProfilePage()), 
                    );
                  },
                );
              },
            ),
            // FAB-style IconButton to toggle dark/light mode
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode; // Toggle mode on click
                });
              },
            ),
          ],
        ),

        // Drawer to represent chat history
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black54 : Colors.grey[200],
                ),
                child: Text(
                  'Chat History',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              // Display chat history items in the Drawer
              for (var chat in chatHistory)
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text(chat),
                ),
            ],
          ),
        ),

        body: isDarkMode ? DarkPage() : LightPage(),
      ),
    );
  }
}
