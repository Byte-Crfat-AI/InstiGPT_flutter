import 'package:flutter/material.dart';

class DarkPage extends StatefulWidget {
  @override
  _DarkPageState createState() => _DarkPageState();
}

class _DarkPageState extends State<DarkPage> {
  List<String> chatHistory = [];
  TextEditingController messageController = TextEditingController();

  void addMessage(String message) {
    setState(() {
      chatHistory.add(message);
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850], // Darker background for dark mode
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: chatHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      chatHistory[index],
                      style: TextStyle(color: Colors.white), // White text for dark mode
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(height: 1, color: Colors.white54), // Divider with a lighter color for dark mode
          Container(
            color: Colors.grey[900], // Darker input container background
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                // TextField for input
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        style: TextStyle(color: Colors.white), // White input text
                        decoration: InputDecoration(
                          hintText: 'Start a new chat...',
                          hintStyle: TextStyle(color: Colors.white54), // Lighter hint text
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        onSubmitted: addMessage,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (messageController.text.isNotEmpty) {
                          addMessage(messageController.text);
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Sentences below the prompting box
                Text(
                  "Generated content may be inaccurate or false",
                  style: TextStyle(color: Colors.white54, fontSize: 14), // Lighter text for dark mode
                ),
                Text(
                  "Made with ❤️ by AI Community IIT Bombay",
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
