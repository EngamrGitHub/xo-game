
import 'package:flutter/material.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/widget/xscreen.dart';

import 'o _sreen.dart';

class gamebtn extends StatelessWidget {
    String item ;
    int index ;
    void Function(String item , int index) onBtnTap ;
   gamebtn({super.key,required this.item , required this.index,required this.onBtnTap});

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          child:
          InkWell(
            onTap: () {
              onBtnTap(item,index);
            },
            child: Container(
              child:
              item == "x" ? xScreen() :  item == "o" ? oScreen() :
              SizedBox(
                height: 100,
                width: 100,
              ),
            ),
          ),
      );
  }
}
