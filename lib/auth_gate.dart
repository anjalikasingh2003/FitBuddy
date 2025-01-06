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




import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(  // Applying dark theme
        scaffoldBackgroundColor: Colors.black,  // Set background to black
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],  // Dark background for input fields
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
          bodyLarge: TextStyle(color: Colors.white),  // Use bodyLarge instead of bodyText1
          bodyMedium: TextStyle(color: Colors.white),  // Use bodyMedium instead of bodyText2
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
                      'FitBuddy',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,              
                        color: Colors.white,
                        letterSpacing: 2,  // White title text
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
                            'Welcome to FitBuddy, please sign in!',
                            style: TextStyle(color: Colors.white),  // White subtitle text
                          )
                        : const Text(
                            'Welcome to FitBuddy, please sign up!',
                            style: TextStyle(color: Colors.white),  // White subtitle text
                          ),
                  ),
                );
              },
              footerBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey),  // Grey footer text
                  ),
                );
              },
            );
          }

          return const ProfiScreen();  // Your profile screen after login
        },
      ),
    );
  }
}
