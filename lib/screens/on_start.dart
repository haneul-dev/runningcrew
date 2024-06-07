// on_start.dart
import 'package:flutter/material.dart';
import 'on_end.dart'; // OnEndPage의 경로를 추가

class OnStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 변경
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "0'00\"",
                      style: TextStyle(fontSize: 18, color: Colors.black), // 페이스 텍스트 색상 변경
                    ),
                    Text(
                      "페이스",
                      style: TextStyle(fontSize: 16, color: Color(0xFF735858)), // 페이스 라벨 텍스트 색상 변경
                    ),
                  ],
                ),
                SizedBox(width: 20), // 간격
                Column(
                  children: [
                    Text(
                      "0:00",
                      style: TextStyle(fontSize: 18, color: Colors.black), // 시간 텍스트 색상 변경
                    ),
                    Text(
                      "시간",
                      style: TextStyle(fontSize: 16, color: Color(0xFF735858)), // 시간 라벨 텍스트 색상 변경
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50), // 간격
            Text(
              "0.00",
              style: TextStyle(
                fontSize: 40, // 거리 표시 텍스트 크기 변경
                fontWeight: FontWeight.bold,
                color: Colors.black, // 텍스트 색상 변경
              ),
            ),
            SizedBox(height: 5), // 간격
            Text(
              "킬로미터",
              style: TextStyle(fontSize: 18, color: Color(0xFF735858)), // 거리 단위 표시 텍스트 색상 변경
            ),
            SizedBox(height: 50), // 간격
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnEndPage()), // OnEndPage로 이동
                );
              },
              child: Container(
                height: 70, // 크기 조정
                width: double.infinity, // 전체 가로폭
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 2), // 완주 버튼의 테두리를 검정색으로 변경
                  shape: BoxShape.circle, // 동그라미 모양
                ),
                margin: EdgeInsets.only(top: 20), // 위치 조정
                child: Center(
                  child: Text(
                    "완주",
                    style: TextStyle(
                      color: Colors.black, // 검정 색상
                      fontSize: 16, // 글자 크기
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
