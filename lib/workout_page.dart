import 'package:fir_n_flow/strength_training.dart';
import 'package:flutter/material.dart';
import 'cardio_page.dart';
import 'hiit_page.dart';
import 'FullWorkoutPage.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        flexibleSpace: Center(
        child: Text(
          'WORKOUT',
           style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600, 
            fontSize: 28,
            ),
        ),
        ),
        backgroundColor: Color.fromARGB(255, 77, 0, 80),
     ),
      body: Container(
         color: Colors.black, // Set the background of the body to black
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             SizedBox(height: 150),
            Text(
              'Select an Option',
              style: TextStyle(fontSize: 24,
              color: Colors.white
              ),
            ),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                // Navigate to AI Assistant page (create this page later)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullWorkoutPage()),
                );
              },
              child: Text('Full Body Workout',
              style: TextStyle(
                    fontWeight: FontWeight.bold, // Set text to bold
                    fontSize: 18,
                  ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set button background to white
                  foregroundColor: Colors.black, 
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Cardio page (create this page later)
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardioPage()),
                );
              },
              child: Text('Cardio',
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
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Strength Training page (create this page later)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StrengthtrainingPage()),
                );
              },
              child: Text('Strength Training',
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
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to HIIT page (create this page later)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HIITPage()),
                );
              },
              child: Text('High-Intensity Interval Training',
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
