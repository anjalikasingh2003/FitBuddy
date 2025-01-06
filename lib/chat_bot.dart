// import 'package:flutter/material.dart';
// import 'openai_service.dart';

// class ChatbotPage extends StatefulWidget {
//   @override
//   _ChatbotPageState createState() => _ChatbotPageState();
// }

// class _ChatbotPageState extends State<ChatbotPage> {
//   final OpenAIService _service = OpenAIService();
//   final TextEditingController _controller = TextEditingController();
//   List<Map<String, String>> messages = [];

//   @override
//   void initState() {
//     super.initState();
//     // Adding the initial message from the chatbot
//     messages.add({
//       "role": "assistant",
//       "content": "Hey! I am your Fitness Buddy. I can create any type of fitness plan for you."
//     });
//   }

//   void _sendMessage() async {
//     if (_controller.text.isEmpty) return;
//     final userMessage = _controller.text;

//     setState(() {
//       messages.add({"role": "user", "content": userMessage});
//       // Adding a loading message for the user
//       messages.add({"role": "assistant", "content": "Loading... Please wait while I process your request."});
//     });
//     _controller.clear();

//     // Formatting the message for OpenAI service
//     final requestMessage = "Please make a weekly exercise plan for someone with goal - $userMessage";
//     final response = await _service.sendMessage(requestMessage);

//     setState(() {
//       // Removing the loading message
//       messages.removeLast();
//       // Adding the response from the OpenAI service
//       messages.add({"role": "assistant", "content": response});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Fit Buddy"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];
//                 return ListTile(
//                   title: Text(
//                     message["content"]!,
//                     textAlign: message["role"] == "user"
//                         ? TextAlign.right
//                         : TextAlign.left,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: "Type your message",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//colour theme
// (const Color.fromARGB(255, 233, 0, 116).withOpacity(1)) ,(255, 255, 240, 120) , 

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
  bool isLoading = false;

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
      isLoading = true;
    });
    _controller.clear();

    final requestMessage = "Please make a weekly exercise plan for someone with goal - $userMessage";
    final response = await _service.sendMessage(requestMessage);

    setState(() {
      isLoading = false;
      messages.add({"role": "assistant", "content": response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FITBUDDY",
          style: TextStyle(
            fontFamily: "DM-Sans",
            color: Color.fromARGB(255, 216, 159, 253),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0,0,0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 39, 37, 38),
              const Color.fromARGB(255, 0, 0, 0)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isUser = message["role"] == "user";

                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(12.0),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: isUser
                            ? const Color.fromARGB(255, 131,58,180)
                            : const Color.fromARGB(255, 114, 114, 114),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: Radius.circular(isUser ? 12 : 0),
                          bottomRight: Radius.circular(isUser ? 0 : 12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          )
                        ],
                      ),
                      child: Text(
                        message["content"]!,
                        style: TextStyle(
                          color: isUser ? Colors.white : const Color.fromARGB(221, 255, 255, 255),
                          fontSize: 20,
                          fontFamily: "DM-Sans",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 114, 114, 114),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type your message",
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 114, 114, 114),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
