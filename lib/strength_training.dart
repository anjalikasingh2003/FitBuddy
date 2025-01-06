import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:http/http.dart' as http;

class StrengthtrainingPage extends StatefulWidget {
  @override
  _StrengthtrainingPageState createState() => _StrengthtrainingPageState();
}

class _StrengthtrainingPageState extends State<StrengthtrainingPage> {
  final _controller = YoutubePlayerController();

  // Video IDs
  final List<String> videoIds = ["_l3ySVKYVJ8", "C_VtOYc6j5c", "auBLPXO8Fww"];
  int currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.loadVideoById(videoId: videoIds[currentVideoIndex]);
  }

  void _startVideo() async {
    // Start the video first
    _controller.playVideo();

    // Then send the request to start the workout
    await _sendStartWorkoutRequest();
  }

  void _stopVideo() {
    _controller.pauseVideo();
  }

  void _nextVideo() {
    if (currentVideoIndex < videoIds.length - 1) {
      currentVideoIndex++;
    } else {
      _showWorkoutCompletedDialog();
      return; // Prevent loading the next video if workout is completed
    }
    _controller.loadVideoById(videoId: videoIds[currentVideoIndex]);
    // Don't start the video immediately here, wait for user to press start
  }

  void _showWorkoutCompletedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Workout Completed'),
          content: Text('Great job! You have completed this exercise.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // This will pop the dialog
                Navigator.pop(context); // This will pop the CardioPage and go back
              },
              child: Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendStartWorkoutRequest() async {
    String url;
    if (currentVideoIndex == 0) {
      // For the first video (Pushups)
      url = 'http:// 10.61.2.77:5002/pushups'; // Replace with your Flask URL for pushups
    } else {
      // For the subsequent videos (Squats)
      url = 'http:// 10.61.2.77:5002/squats'; // Replace with your Flask URL for squats
    }

    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        // Handle the response if needed
        print('Workout started successfully: ${currentVideoIndex == 0 ? "Pushups" : "Squats"}');
      } else {
        // Handle the error
        print('Failed to start workout: ${response.body}');
      }
    } catch (error) {
      print('Error sending request: $error');
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       flexibleSpace: Center(
        child: Text(
          'STRENGTH TRAINING',
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
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 300,
                height: 200,
                child: YoutubePlayer(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startVideo,
                  child: Text('Start',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopVideo,
                  child: Text('Stop',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _nextVideo,
                  child: Text('Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
