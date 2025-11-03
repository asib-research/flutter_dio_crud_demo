import 'package:flutter/material.dart';
import 'package:test_project/presentations/screens/post_screen.dart';

class FlutterDioDemo extends StatelessWidget {
  const FlutterDioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}
