import 'package:flutter/material.dart';
import 'openai_service.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final OpenAIService _service = OpenAIService();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  @override
  void initState() {
    super.initState();
    // Adding the initial message from the chatbot
    messages.add({
      "role": "assistant",
      "content": "Hey! I am your Fitness Buddy. I can create any type of fitness plan for you."
    });
  }

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    final userMessage = _controller.text;

    setState(() {
      messages.add({"role": "user", "content": userMessage});
      // Adding a loading message for the user
      messages.add({"role": "assistant", "content": "Loading... Please wait while I process your request."});
    });
    _controller.clear();

    // Formatting the message for OpenAI service
    final requestMessage = "Please make a weekly exercise plan for someone with goal - $userMessage";
    final response = await _service.sendMessage(requestMessage);

    setState(() {
      // Removing the loading message
      messages.removeLast();
      // Adding the response from the OpenAI service
      messages.add({"role": "assistant", "content": response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fit Buddy"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(
                    message["content"]!,
                    textAlign: message["role"] == "user"
                        ? TextAlign.right
                        : TextAlign.left,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type your message",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
