import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import Lottie
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // Import Firebase Auth UI
import 'workout_page.dart'; // Import the WorkoutPage
import 'yoga_page.dart'; // Import the YogaPage
import 'chat_bot.dart'; // Import the ChatbotWidget
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class ProfiScreen extends StatelessWidget {
  const ProfiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Fullscreen width
        height: double.infinity, // Fullscreen height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Circuit_Training.jpeg'), // Background image
            fit: BoxFit.cover, // Ensure the image covers the entire screen
            alignment: Alignment.center, // Center the image
          ),
        ),
        child: Column(
          children: [
            // Custom AppBar with transparent background
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20), // Padding for AppBar height
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // Semi-transparent background
              ),
              child: Text(
                'WELCOME TO FITNFLOW',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white, // White text color for visibility
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 3.5,
                ),
              ),
            ),
            const SizedBox(height: 350), // Increase spacing below the welcome text

            // Workout Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.black, // Transparent button background
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  side: const BorderSide(color: Colors.transparent),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 105, 55, 107).withOpacity(1)),
              ),
              child: const Text(
                'WORKOUT',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w600, 
                  color: Colors.white,
                  letterSpacing: 2.5,
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing between Workout and Yoga buttons

            // Yoga Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YogaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  side: const BorderSide(color: Colors.transparent),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 105, 55, 107).withOpacity(1)),
              ),
              child: const Text(
                'YOGA',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w600, 
                  color: Colors.white, 
                  letterSpacing: 2.5,
                ),
              ),
            ),
            const SizedBox(height: 40), // Spacing before sign-out button

            // Sign out button
            const SignOutButton(),
            const SizedBox(height: 20), // Extra spacing at the bottom
          ],
        ),
      ),
      
      // Floating Action Button for Chatbot with large animation and separate button
      floatingActionButton: Padding(
  padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 150,
        height: 150,
        child: Lottie.asset(
          'assets/chatbot_animation.json',
          width: 200,
          height: 200,
        ),
      ),
      FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatbotPage()),
        );
        },
        backgroundColor: Colors.black,
        label: const Text(
          "How may I help you?",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        icon: const Icon(Icons.chat),
      ),
    ],
  ),
),

    );
  }
}
