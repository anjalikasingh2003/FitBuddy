import 'package:flutter/material.dart';

class TrianglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangle Pose'),
      ),
      body: Center(
        child: Text(
          'Information about Triangle Pose will be displayed here.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
