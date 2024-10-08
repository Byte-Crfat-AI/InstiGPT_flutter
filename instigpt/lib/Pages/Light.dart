import 'package:flutter/material.dart';

class LightPage extends StatefulWidget {
  @override
  _LightPageState createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
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
      backgroundColor: Colors.grey[200],
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
                      style: TextStyle(color: Colors.black87),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                // TextField for input
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Start a new chat...',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        onSubmitted: addMessage,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
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
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                Text(
                  "Made with ❤️ by AI Community IIT Bombay",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
