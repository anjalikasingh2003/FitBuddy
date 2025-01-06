// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';

// import 'profile.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providers: [
//                 EmailAuthProvider(),
//             ],
//         //      headerBuilder: (context, constraints, shrinkOffset) {
//         //      return Padding(
//         //        padding: const EdgeInsets.all(20),
//         //        child: AspectRatio(
//         //          aspectRatio: 1,
//         //          child: Image.asset('assets/profile.jpg'),
//         //        ),
//         //      );
//         //    },
//            subtitleBuilder: (context, action) {
//              return Padding(
//                padding: const EdgeInsets.symmetric(vertical: 8.0),
//               // child: Center(
//                child: action == AuthAction.signIn
//                    ? const Text('Welcome to FitFlow, please sign in!')
//                    : const Text('Welcome to FitFlow, please sign up!'),
//               // ),
//              );
//            },
//            footerBuilder: (context, action) {
//              return const Padding(
//                padding: EdgeInsets.only(top: 16),
//                child: Text(
//                  'By signing in, you agree to our terms and conditions.',
//                  style: TextStyle(color: Colors.grey),
//                ),
//              );
//            },
//         //    sideBuilder: (context, shrinkOffset) {
//         //      return Padding(
//         //        padding: const EdgeInsets.all(20),
//         //        child: AspectRatio(
//         //          aspectRatio: 1,
//         //          child: Image.asset('assests/profile.jpg'),
//         //        ),
//         //      );
//         //    },
//           );
//         }

//         return const ProfiScreen();
//       },
//     );
//   }
// }


//here is workingcode

// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';

// import 'profile.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(  // Applying dark theme
//         scaffoldBackgroundColor: Colors.black,  // Set background to black
//         primaryColor: Colors.white,
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.grey[800],  // Dark background for input fields
//           hintStyle: TextStyle(color: Colors.white),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(color: Colors.white),
//           ),
//         ),
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),  // Use bodyLarge instead of bodyText1
//           bodyMedium: TextStyle(color: Colors.white),  // Use bodyMedium instead of bodyText2
//         ),
//       ),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return SignInScreen(
//               providers: [
//                 EmailAuthProvider(),
//               ],
//               headerBuilder: (context, constraints, shrinkOffset) {
//                 return Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Center(
//                     child: Text(
//                       'Fit N Flow',
//                       style: TextStyle(
//                         fontSize: 35,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.bold,              
//                         color: Colors.white,
//                         letterSpacing: 2,  // White title text
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               subtitleBuilder: (context, action) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: action == AuthAction.signIn
//                         ? const Text(
//                             'Welcome to Fit N Flow, please sign in!',
//                             style: TextStyle(color: Colors.white),  // White subtitle text
//                           )
//                         : const Text(
//                             'Welcome to Fit N Flow, please sign up!',
//                             style: TextStyle(color: Colors.white),  // White subtitle text
//                           ),
//                   ),
//                 );
//               },
//               footerBuilder: (context, action) {
//                 return const Padding(
//                   padding: EdgeInsets.only(top: 16),
//                   child: Text(
//                     'By signing in, you agree to our terms and conditions.',
//                     style: TextStyle(color: Colors.grey),  // Grey footer text
//                   ),
//                 );
//               },
//             );
//           }

//           return const ProfiScreen();  // Your profile screen after login
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For HTTP requests
import 'dart:convert'; // For JSON encoding

import 'profile.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  // Function to send email and password to Flask backend
  Future<void> storeUserData(String email, String password) async {
    const String backendUrl = 'http://127.0.0.1:5000/store-user'; // Replace with your Flask backend URL

    try {
      final response = await http.post(
        Uri.parse(backendUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print('User data stored successfully!');
      } else {
        print('Failed to store user data: ${response.body}');
        throw Exception('Failed to store user data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith( // Applying dark theme
        scaffoldBackgroundColor: Colors.black, // Set background to black
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800], // Dark background for input fields
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Use bodyLarge instead of bodyText1
          bodyMedium: TextStyle(color: Colors.white), // Use bodyMedium instead of bodyText2
        ),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Fit N Flow',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White title text
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: action == AuthAction.signIn
                        ? const Text(
                            'Welcome to Fit N Flow, please sign in!',
                            style: TextStyle(color: Colors.white), // White subtitle text
                          )
                        : const Text(
                            'Welcome to Fit N Flow, please sign up!',
                            style: TextStyle(color: Colors.white), // White subtitle text
                          ),
                  ),
                );
              },
              footerBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey), // Grey footer text
                  ),
                );
              },
            );
          }

          final user = snapshot.data!;
          final String email = user.email!;

          // Send user data to Flask backend
          storeUserData(email, 'placeholder_password'); // Replace with proper password handling logic

          return const ProfiScreen(); // Your profile screen after login
        },
      ),
    );
  }
}
