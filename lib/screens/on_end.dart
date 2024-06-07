// on_end.dart
import 'package:flutter/material.dart';

class OnEndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 변경
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
        title: Text(
          "오늘의 러닝",
          style: TextStyle(color: Colors.black), // 검정색으로 텍스트 색상 변경
        ),
        elevation: 0, // 상단 바 밑줄 추가
        backgroundColor: Colors.white, // 상단 바 배경색 변경
      ),
      body: Container(
        color: Colors.white, // 본문 배경색 변경
        padding: EdgeInsets.all(20), // 내부 패딩 설정
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20), // 간격 조정
                padding: EdgeInsets.all(20), // 내부 패딩 설정
                decoration: BoxDecoration(
                  color: Color(0xFFF6F5F2), // 사각형 첫번째 배경색
                  borderRadius: BorderRadius.circular(10), // 모서리 둥근 처리
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // 위치 조정
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.8, // 컨테이너가 화면 가로폭을 80% 차지하게 설정
                child: Column(
                  children: [
                    Text(
                      "2.89",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "킬로미터",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10), // 간격 조정
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "6'45\"",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "페이스",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "134",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "칼로리",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "27:35",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "시간",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20), // 내부 패딩 설정
                decoration: BoxDecoration(
                  color: Color(0xFFF6F5F2), // 사각형 두번째 배경색
                  borderRadius: BorderRadius.circular(10), // 모서리 둥근 처리
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // 위치 조정
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.8, // 컨테이너가 화면 가로폭을 80% 차지하게 설정
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "new!",
                      style: TextStyle(fontSize: 14, color: Colors.red), // new! 텍스트 색상 변경
                    ),
                    Text(
                      "총 달린 거리: 13.56",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // 간격 조정
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}