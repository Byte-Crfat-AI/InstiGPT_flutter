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
      body: Row(
        children: [
          // Left column for chat history
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.grey[300],
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    chatHistory[index],
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          ),

          // Right side for chat and input
          Expanded(
            child: Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: 'Start a new chat...',
                            border: InputBorder.none,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
