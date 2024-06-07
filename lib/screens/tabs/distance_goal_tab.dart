import 'package:flutter/material.dart';

class DistanceGoalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80), // 필요에 따라 여백을 조정합니다
      child: Column(
        children: [
          Image.asset(
            'assets/icons/distanceIcon.png', // 목표 거리 아이콘 경로
            height: 240,
            width: 240,
          ),
          SizedBox(height: 30), // 여백을 줄입니다.
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey, // 배경색 설정
              borderRadius: BorderRadius.circular(70), // 둥근 모서리 설정
            ),
            child: Text(
              '3KM',
              style: TextStyle(
                fontSize: 18, // 글자 크기
                color: Colors.white, // 글자 색상
              ),
            ),
          ),
        ],
      ),
    );
  }
}