import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TreePosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text('Tree Pose'),
        flexibleSpace: Center(
        child: Text(
          'TREE POSE',
           style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600, 
            fontSize: 28,
            ),
        ),
      ),
        backgroundColor: Color.fromARGB(255, 233, 0, 116), // Set AppBar background to black
      ),
      body: Container(
         color: Colors.black, 
         child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Display the image with adjusted size
            SizedBox(height: 200),
            Flexible(
              child: Image.asset(
                'assets/img_tree_pose.jpg', // Ensure the path is correct
                fit: BoxFit.contain, // This scales the image to fit within its bounds
                height: 250, // Set a fixed height or remove this to scale dynamically
              ),
            ),
            
            SizedBox(height: 20), // Space between image and button

            // Display the Start button
            ElevatedButton(
              onPressed: () {
                _runTreePoseScript();
              },
              child: Text(
                'Start',
                style: TextStyle(
                    fontWeight: FontWeight.bold, // Set text to bold
                    fontSize: 18,
                  ),
                ),
               style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set button background to white
                  foregroundColor: Colors.black, // Set button text color to black
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  
                ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  // Function to run the Tree_pose.py script
  void _runTreePoseScript() async {
    try {
      final response = await http.get(Uri.parse('http://10.61.2.77:5004/Tree_pose'));
      
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print('STDOUT: ${jsonResponse['stdout']}');
        print('STDERR: ${jsonResponse['stderr']}');
      } else {
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Error running script: $e');
    }
  }
}
