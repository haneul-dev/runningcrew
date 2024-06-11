import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart'; // HomeScreen의 경로를 추가

class OnEndPage extends StatelessWidget {
  final String pace;
  final String distance;
  final String time;

  OnEndPage({required this.pace, required this.distance, required this.time});

  Future<void> _updateRecentData(double distance, String pace, String time, int calories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('recent_distance', distance);
    await prefs.setString('recent_pace', pace);
    await prefs.setString('recent_time', time);
    await prefs.setInt('recent_calories', calories);
  }

  Future<void> _updateTotalData(double newDistance, String newPace, String newTime, int newCalories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double totalDistance = prefs.getDouble('total_distance') ?? 0.0;
    totalDistance += newDistance;
    await prefs.setDouble('total_distance', totalDistance);

    // For simplicity, assume newPace and newTime are the averages; more complex logic can be added
    await prefs.setString('total_pace', newPace);
    await prefs.setString('total_time', newTime);

    int totalCalories = prefs.getInt('total_calories') ?? 0;
    totalCalories += newCalories;
    await prefs.setInt('total_calories', totalCalories);
  }

  @override
  Widget build(BuildContext context) {
    double distanceKm = double.tryParse(distance) ?? 0.0;
    int calories = (distanceKm * 60).toInt(); // 1km 당 60 칼로리 소모로 계산

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
      body: GestureDetector(
        onTap: () async {
          await _updateRecentData(distanceKm, pace, time, calories);
          await _updateTotalData(distanceKm, pace, time, calories);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
          ); // HomeScreen으로 이동
        },
        child: Container(
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
                        distance,
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
                                pace,
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
                                calories.toString(),
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
                                time,
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
                FutureBuilder<double>(
                  future: _getTotalDistance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      double updatedTotalDistance = snapshot.data! + distanceKm; // 총 달린 거리에 이번 주행 거리 추가
                      return Container(
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
                              "총 달린 거리: ${updatedTotalDistance.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10), // 간격 조정
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<double> _getTotalDistance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('total_distance') ?? 0.0;
  }
}
