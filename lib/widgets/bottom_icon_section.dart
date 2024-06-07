// bottom_icon_section.dart
import 'package:flutter/material.dart';

class BottomIconSection extends StatelessWidget {
  final VoidCallback onStartPressed; // 시작 버튼을 누를 때 호출될 콜백 함수

  BottomIconSection({required this.onStartPressed}); // 생성자에서 콜백 함수를 받습니다

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 48,
            ),
            onPressed: () {},
          ),
          OutlinedButton(
            onPressed: onStartPressed, // onStartPressed 함수를 호출
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black, width: 2), // 테두리 설정
              shape: CircleBorder(), // 원형 버튼
              padding: EdgeInsets.all(26), // 버튼의 패딩
            ),
            child: Text(
              '시작',
              style: TextStyle(
                fontSize: 18, // 글자 크기
                color: Colors.black, // 글자 색상
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.person_outline,
              size: 48,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
