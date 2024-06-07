import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isToday = true; // 초기 상태는 "오늘"
  double todayDistance = 3.14;
  String todayPace = '6\'24\"';
  String todayTime = '12:34';
  int todayCalories = 128;
  double totalDistance = 13.07;
  String totalPace = '7\'54\"';
  String totalTime = '62:37';
  int totalCalories = 897;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 8),
            Text('내 정보'),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon/Ellipse 6.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'User_Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  InfoCard(
                      title: '거리',
                      content: isToday ? todayDistance.toString() : totalDistance.toString(),
                      backgroundColor: Color(0xFFF6F5F2)),
                  InfoCard(
                      title: '페이스',
                      content: isToday ? todayPace : totalPace,
                      backgroundColor: Color(0xFFF0EBE3)),
                  InfoCard(
                      title: '시간',
                      content: isToday ? todayTime : totalTime,
                      backgroundColor: Color(0xFFF3D0D7)),
                  InfoCard(
                      title: '칼로리',
                      content: isToday ? todayCalories.toString() : totalCalories.toString(),
                      backgroundColor: Color(0xFFFFEFEF)),
                ],
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                setState(() {
                  isToday = !isToday; // "오늘"과 "누적" 상태 변경
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.transparent, // 투명한 배경색
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black), // 검정색 테두리 추가
                ),
                child: Center(
                  child: Text(
                    isToday ? '오늘' : '누적', // 상태에 따라 텍스트 변경
                    style: TextStyle(
                      color: Colors.black, // 텍스트 색상
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final Color backgroundColor;

  InfoCard({required this.title, required this.content, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
