import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:http/http.dart' as http;

class CardioPage extends StatefulWidget {
  @override
  _CardioPageState createState() => _CardioPageState();
}

class _CardioPageState extends State<CardioPage> {
  final _controller = YoutubePlayerController();

  // Video IDs
  final List<String> videoIds = ["XPU9K9QM7ME", "auBLPXO8Fww", "L8fvypPrzzs", "S7HEm-fd534"];
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
    }
    _controller.loadVideoById(videoId: videoIds[currentVideoIndex]);
    _startVideo();
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
    final url = Uri.parse('http://10.61.2.77:5002/jumpingjacks'); // Replace with your Flask URL
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        // Handle the response if needed
        print('Workout started successfully');
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
        title: Text('Cardio Workouts'),
      ),
      body: Center(
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
                  child: Text('Start'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopVideo,
                  child: Text('Stop'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _nextVideo,
                  child: Text('Next'),
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
