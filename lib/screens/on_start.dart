// on_start.dart
import 'package:flutter/material.dart';

class OnStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("On Start Page"),
      ),
      body: Center(
        child: Text(
          "이곳은 시작 페이지입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
