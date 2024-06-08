import 'package:flutter/material.dart';
import '../screens/run_screen.dart'; // RunScreen import 추가
import '../screens/club_page.dart'; // ClubPage import 추가
import '../screens/personal_page.dart'; // PersonalPage import 추가

class BottomIconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border, size: 48),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClubListPage()),
              );
            },
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RunScreen()),
              );
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black, width: 2),
              shape: CircleBorder(),
              padding: EdgeInsets.all(26),
            ),
            child: Text(
              '시작',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          IconButton(
            icon: Icon(Icons.person_outline, size: 48),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}