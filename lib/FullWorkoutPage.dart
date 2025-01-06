
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class FullWorkoutPage extends StatefulWidget {
  @override
  _FullWorkoutPageState createState() => _FullWorkoutPageState();
}

class _FullWorkoutPageState extends State<FullWorkoutPage> {
  String message = "You have to do 10 Jumping Jacks, 10 Pushups, 10 Squats";
  bool isWorkoutStarted = false; // Track whether workout has started

  @override
  void initState() {
    super.initState();
    // Set a timer to hide the initial message after 5 seconds
    Timer(Duration(seconds: 2), () {
      setState(() {
        message = "Get ready to start your workout!";
      });
      // Start the workout sequence after 3 seconds
      Timer(Duration(seconds: 2), () {
        setState(() {
          isWorkoutStarted = true;
          message = "Starting exercises...";
        });
        print("Calling executeExercises...");
        executeExercises(); // Start workout
      });
    });
  }

  Future<void> executeExercises() async {
    try {
      // Start Jumping Jacks
      var response = await http.get(Uri.parse('http:// 10.61.2.77:5001/jumpingjacks'));
      if (response.statusCode == 200) {
        print("Jumping Jacks started: ${response.body}");
        // Wait for Jumping Jacks to complete
        await Future.delayed(Duration(seconds: 10)); // Adjust time as needed
      } else {
        print("Error starting Jumping Jacks: ${response.body}");
      }

      // Start Pushups
      response = await http.get(Uri.parse('http:// 10.61.2.77:5001/pushups'));
      if (response.statusCode == 200) {
        print("Pushups started: ${response.body}");
        // Optionally wait for Pushups to complete
        await Future.delayed(Duration(seconds: 10)); // Adjust time as needed
      } else {
        print("Error starting Pushups: ${response.body}");
      }

      // Start Squats
      response = await http.get(Uri.parse('http:// 10.61.2.77:5001/squats'));
      if (response.statusCode == 200) {
        print("Squats started: ${response.body}");
        // Wait for Squats to complete
        await Future.delayed(Duration(seconds: 10)); // Adjust time as needed
      } else {
        print("Error starting Squats: ${response.body}");
      }
    } catch (e) {
      print("Error during exercises: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       flexibleSpace: Center(
        child: Text(
          'FULL BODY WORKOUT',
           style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600, 
            fontSize: 28,
            ),
        ),
      ),
        backgroundColor: Color.fromARGB(255, 77, 0, 80),// AppBar background set to black
      ),
      body: Container(
        color: Colors.black, // Set background to black
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white, // Set text color to white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

