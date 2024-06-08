import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // PlatformException을 사용하기 위해 추가
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:running_crew/main.dart';
import 'home_screen.dart'; // 홈 화면 파일을 import

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지
          Positioned.fill(
            child: Image.asset(
              'assets/icons/login_image.png', // 이미지 경로 수정
              fit: BoxFit.cover, // 이미지 크기 조정
            ),
          ),
          // 상단의 Running Crew 텍스트
          Positioned(
            top: 10,
            left: 17,
            child: Text(
              'Running Crew',
              style: TextStyle(
                fontFamily: 'Abhaya Libre',
                fontWeight: FontWeight.w800, // ExtraBold
                fontSize: 40, // 글씨 크기 40pt로 수정
                color: Colors.white,
              ),
            ),
          ),
          // 로그인 버튼
          Positioned(
            bottom: 46,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  signInWithKaKao(context); // context를 전달
                },
                child: Image.asset(
                  'assets/icons/kakao_login.png',
                  width: 200, // 버튼 크기 조정
                  height: 50,
                ),
              ),
            ),
          ),
          // 최하단의 문구
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Center(
              child: Opacity(
                opacity: 0.2,
                child: Text(
                  'Life is short, Run',
                  style: TextStyle(
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w800, // ExtraBold
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void navigatorToMainPage(BuildContext context){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
        ));
  }

  Future<void> signInWithKaKao(BuildContext context) async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk().then((value) {
          print('value from kakao $value');
          navigatorToMainPage(context);
        });
        print('카카오톡으로 로그인 성공');

      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount().then((value) {
            print('value from kakao $value');
            navigatorToMainPage(context);
          });
          print('카카오톡으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount().then((value) {
          print('value from kakao $value');
          navigatorToMainPage(context);
        });
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }
}
