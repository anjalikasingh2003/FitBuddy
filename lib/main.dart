import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart'; // Import for animation
import 'home_page.dart'; // Create this file later
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // Make sure this file exists
import 'app.dart'; // Create this file later

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  // runApp(FitnFlowApp());
  runApp(const MyApp());
}

// class FitnFlowApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FitNFlow',
//       theme: ThemeData(
//         primarySwatch: Colors.teal, // Use a more fitness-oriented primary color
//         brightness: Brightness.dark, // Set dark theme for background
//       ),
//       home: AnimatedSplashScreen(), // Use AnimatedSplashScreen for animation
//     );
//   }
// }

// class AnimatedSplashScreen extends StatefulWidget {
//   @override
//   _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
// }

// class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> with TickerProviderStateMixin {
//   late AnimationController _controllerFit;
//   late AnimationController _controllerFlow;
//   late Animation<Offset> _animationFit;
//   late Animation<Offset> _animationFlow;

//   @override
//   void initState() {
//     super.initState();

//     _controllerFit = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _controllerFlow = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _animationFit = Tween<Offset>(
//       begin: const Offset(-1.5, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controllerFit,
//       curve: Curves.elasticOut,
//     ));

//     _animationFlow = Tween<Offset>(
//       begin: const Offset(1.5, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controllerFlow,
//       curve: Curves.elasticOut,
//     ));

//     _controllerFit.forward();
//     _controllerFlow.forward();

//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controllerFit.dispose();
//     _controllerFlow.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBackground(
//         behaviour: RandomParticleBehaviour(
//           options: ParticleOptions(
//             baseColor: Colors.teal.withOpacity(0.3),
//             spawnMinRadius: 5.0,
//             spawnMaxRadius: 10.0,
//             particleCount: 100,
//             minOpacity: 0.2,
//             maxOpacity: 0.8,
//           ),
//         ),
//         vsync: this,
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SlideTransition(
//                 position: _animationFit,
//                 child: ShinyText(
//                   text: 'Fit',
//                   gradient: LinearGradient(
//                     colors: [Colors.blue, Colors.green],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10), // Add some space between words
//               SlideTransition(
//                 position: _animationFlow,
//                 child: ShinyText(
//                   text: 'Flow',
//                   gradient: LinearGradient(
//                     colors: [Colors.green, Colors.yellow],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ShinyText extends StatelessWidget {
//   final String text;
//   final Gradient gradient;

//   const ShinyText({
//     Key? key,
//     required this.text,
//     required this.gradient,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => gradient.createShader(bounds),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 60, // Increased font size
//           fontWeight: FontWeight.bold,
//           fontStyle: FontStyle.italic,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }