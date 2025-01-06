import 'package:flutter/material.dart';
import 'tree_pose_page.dart'; // Import the tree pose page
import 'triangle_page.dart'; // Import the triangle pose page
import 'plank_page.dart'; // Import the plank page

class YogaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
        child: Text(
          'YOGA',
           style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600, 
            fontSize: 28,
            ),
        ),
      ),
        backgroundColor: Color.fromARGB(255, 77, 0, 80),// Set AppBar background to black
       
      ),
      body: Container(
        color: Colors.black, // Set the background of the body to black
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Text(
                'Choose Yoga Pose',
                style: TextStyle(
                  fontSize: 24,
                   color: Colors.white
                   
                   ), // Set text color to white
              ),
              SizedBox(height: 50), // Space between text and buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TreePosePage()),
                  );
                },
                child: Text(
                  'Tree Pose',
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
              SizedBox(height: 30), // Space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrianglePage()),
                  );
                },
                child: Text('Triangle',
                style: TextStyle(
                    fontWeight: FontWeight.bold, // Set text to bold
                    fontSize: 18,
                  ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set button background to white
                  foregroundColor: Colors.black, // Set button text color to black
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
              SizedBox(height: 30), // Space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlankPage()),
                  );
                },
                child: Text('Plank',
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
}

