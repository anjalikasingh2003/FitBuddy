import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  static const String _baseUrl = "http://127.0.0.1:5001/chat"; // Replace with your backend URL

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["response"] ?? "Error: No response from server.";
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      print("error");
      return "Error: $e";
    }
  }
}