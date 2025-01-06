import 'package:flutter/material.dart';

class PlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plank Pose'),
      ),
      body: Center(
        child: Text(
          'Information about Plank Pose will be displayed here.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
