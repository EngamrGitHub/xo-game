
import 'dart:async';

import 'package:flutter/material.dart';

import 'widget/gamebtn.dart';

class gameScreen extends StatefulWidget {
static const String routeName = '/gameScreen';

  @override
  State<gameScreen> createState() => _gameScreenState();

}
class _gameScreenState extends State<gameScreen> {
  List<String> Taps = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  ];
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff00D2FF), Color(0xff3A7BD5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 15,),
              Expanded(
                child: Container(
                  // width: 342,
                  // padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Text(
                    '$m:$s',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              // SizedBox(height: 20,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Player ${isXPlays ? 1 :2}’s Turn'
                    , style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Column(
                    children: [
                      Expanded(child: Row(
                          children: [
                            gamebtn(
                              onBtnTap: onGameTap,
                              index: 0,
                              item: Taps[0],
                            ),
                            VerticalDivider(thickness: 1, color: Colors.black),
                            gamebtn(
                              onBtnTap: onGameTap,
                              index: 1,
                              item: Taps[1],
                            ),
                            VerticalDivider(thickness: 1, color: Colors.black),
                            gamebtn(
                              onBtnTap: onGameTap,
                              index: 2,
                              item: Taps[2],
                            ),
                          ])),
                      Divider(color: Colors.black, thickness: 1, height: 0),
                      Expanded(child: Row(
                          children: [
                            gamebtn(
                              onBtnTap: onGameTap,
                              index: 3,
                              item: Taps[3],
                            ),
                            VerticalDivider(thickness: 1, color: Colors.black),
                            gamebtn(
                              onBtnTap: onGameTap,
                              index: 4,
                              item: Taps[4],
                            ),
                            VerticalDivider(thickness: 1, color: Colors.black),
                            gamebtn(
                              onBtnTap: onGameTap,
                              index: 5,
                              item: Taps[5],
                            ),
                          ])),
                      Divider(color: Colors.black, thickness: 1, height: 0),
                      Expanded(child: Row(
                        children: [
                          gamebtn(
                            onBtnTap: onGameTap,
                            index: 6,
                            item: Taps[6],
                          ),
                          VerticalDivider(thickness: 1, color: Colors.black),
                          gamebtn(
                            onBtnTap: onGameTap,
                            index: 7,
                            item: Taps[7],
                          ),
                          VerticalDivider(thickness: 1, color: Colors.black),
                          gamebtn(
                            onBtnTap: onGameTap,
                            index: 8,
                            item: Taps[8],
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),

                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isXPlays = false;
  int round = 1;
  int player1Score = 0;
  int player2Score = 0;

  void onGameTap(String item, int index) {
    if (Taps[index] == " ") {
      // تحديد من هو اللاعب الذي يلعب الآن
      if (isXPlays) {
        Taps[index] = "o"; // وضع X في المربع المختار
      } else {
        Taps[index] = "x"; // وضع O في المربع المختار
      }

      // التحقق إذا كان هناك فائز بعد الحركة
      if (checkWinner('x')) {
        player1Score++;
        showGameResultDialog("Player X wins!");
      } else if (checkWinner('o')) {
        player2Score++;
        showGameResultDialog("Player O wins!");
      } else if (isDraw()) {
        showGameResultDialog("It's a draw!");
      }
      // التبديل بين اللاعبين
      isXPlays = !isXPlays;
      round++;
      setState(() {
        // تحديث واجهة المستخدم
        print('Taps after move: $Taps');
      });
    }
  }
  bool checkWinner(String symbol) {
    if (round < 5) return false;
    if (Taps[0] == symbol && Taps[4] == symbol && Taps[8] == symbol) {
      return true;
    }
    if (Taps[2] == symbol && Taps[4] == symbol && Taps[6] == symbol) {
      return true;
    }
    // تحقق أفقي
    // 0 1 2
    // 3 4 5
    // 6 7 8
    for (int i = 0; i <= 6; i += 3) {
      if (Taps[i] == symbol && Taps[i + 1] == symbol && Taps[i + 2] == symbol) {
        return true;
      }
    }
    // تحقق عمودي
    // 0 3 6
    // 1 4 7
    // 2 5 8
    for (int i = 0; i <= 2; i++) {
      if (Taps[i] == symbol && Taps[i + 3] == symbol && Taps[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }
  bool isDraw() {
    return !Taps.contains(" ") && !checkWinner("x") && !checkWinner("o");
  }

  void showGameResultDialog(String resultMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text(resultMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                resetGame();  // إعادة تعيين اللعبة
                Navigator.of(context).pop(); // إغلاق الـ Dialog بعد إعادة تعيين اللعبة
              },
              child: Text("Restart Game"),
            ),
          ],
        );
      },
    );
  }
  int m = 0;
  int s = 0;
  late Timer timer;

// بدء التوقيت
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      s++;
      if (s == 60) {
        m++;
        s = 0;
      }
      setState(() {});
    });
  }

// إيقاف التوقيت
  void stopTimer() {
    if (timer.isActive) {
      timer.cancel(); // إيقاف المؤقت
    }
  }

// إعادة تعيين التوقيت وبدء من جديد
  void resetTimer() {
    if (timer.isActive) {
      stopTimer();// إيقاف المؤقت
    }
    m = 0;  // إعادة تعيين الدقائق
    s = 0;  // إعادة تعيين الثواني
    startTimer(); // بدء التوقيت من جديد
  }

  void resetGame() {
    Taps = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
    round = 1;
    player1Score = 0;
    player2Score = 0;
    isXPlays = true;  // بدء بـ X
    resetTimer();  // إعادة تعيين التوقيت وبدء من جديد
    setState(() {
      // تحديث واجهة المستخدم بعد إعادة تعيين اللعبة
      print('Game reset. Taps: $Taps');
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();  // بدء التوقيت عند تحميل الصفحة
  }
}

