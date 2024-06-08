import 'package:flutter/material.dart';
import 'tabs/time_running_tab.dart';
import 'tabs/distance_goal_tab.dart';
import 'tabs/pace_check_tab.dart';
import '../widgets/bottom_icon_section.dart'; // 추가

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 설정
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 20, bottom: 0), // 필요한 경우 패딩 조정
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, size: 35),
                      onPressed: () {},
                    ),
                    Text(
                      '홈',
                      style: TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: TabBar(
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(text: '타임 러닝'),
                            Tab(text: '목표 거리'),
                            Tab(text: '페이스 체크'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            TimeRunningTab(), // 타임 러닝 탭
                            DistanceGoalTab(), // 목표 거리 탭
                            PaceCheckTab(), // 페이스 체크 탭
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomIconSection(), // BottomIconSection을 Column 안에 배치
              SizedBox(height: 230), // BottomIconSection 아래에 여백 추가
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Running Crew',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Abhaya Libre',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: '타임 러닝'),
                  Tab(text: '목표 거리'),
                  Tab(text: '페이스 체크'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TimeRunningTab(), // 타임 러닝 탭
                  DistanceGoalTab(), // 목표 거리 탭
                  PaceCheckTab(), // 페이스 체크 탭
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}