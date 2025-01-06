// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart'; // Import Lottie
// import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // Import Firebase Auth UI
// import 'workout_page.dart'; // Import the WorkoutPage
// import 'yoga_page.dart'; // Import the YogaPage
// import 'chat_bot.dart'; // Import the ChatbotWidget
// import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

// class ProfiScreen extends StatelessWidget {
//   const ProfiScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity, // Fullscreen width
//         height: double.infinity, // Fullscreen height
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/Circuit_Training.jpeg'), // Background image
//             fit: BoxFit.cover, // Ensure the image covers the entire screen
//             alignment: Alignment.center, // Center the image
//           ),
//         ),
//         child: Column(
//           children: [
//             // Custom AppBar with transparent background
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 20), // Padding for AppBar height
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.5), // Semi-transparent background
//               ),
//               child: Text(
//                 'Welcome to FitNFlow',
//               style: TextStyle( // Use default text style
//                   fontSize: 28,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(height: 350), // Increased spacing below the welcome text

//             // Select an Option text
//             Text(
//               'Select an Option',
//               style: TextStyle(
//                 fontSize: 24, // Font size for the "Select an Option"
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 shadows: [
//                   Shadow(
//                     blurRadius: 10.0,
//                     color: Colors.black.withOpacity(0.7),
//                     offset: Offset(5.0, 5.0),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 40), // Spacing between "Select an Option" and buttons
            
//             // Workout Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => WorkoutPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 backgroundColor: Colors.black, // Changed button background to black
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20), // Rounded corners
//                 ),
//               ),
//               child: Text(
//                 'Workout',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20), // Spacing between Workout and Yoga buttons
            
//             // Yoga Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => YogaPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 backgroundColor: Colors.black, // Changed button background to black
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20), // Rounded corners
//                 ),
//               ),
//               child: Text(
//                 'Yoga',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 40), // Spacing before sign-out button
            
//             // Sign out button
//             const SignOutButton(),
//             SizedBox(height: 20), // Extra spacing at the bottom
//           ],
//         ),
//       ),
//       // Floating Action Button for Chatbot with Lottie animation
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 20.0, right: 20.0), // Adjust position
//         child: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ChatbotWidget()),
//             );
//           },
//           backgroundColor: Colors.blue, // Change the color as needed
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Lottie.asset('assets/chatbot_animation.json', width: 50, height: 50), // Add Lottie animation
//               Positioned(
//                 bottom: 0,
//                 child: Text(
//                   "How may I help you?",
//                   style: TextStyle(fontSize: 12),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
