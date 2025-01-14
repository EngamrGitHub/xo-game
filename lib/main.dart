import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/gamescreen.dart';
import 'package:xo_game/welcomepage.dart';

void main(){
  runApp(xogame());
}
class xogame extends StatelessWidget {
  const xogame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        gameScreen.routeName : (_) => gameScreen(),
        welcomeSreen.routeName : (_) => welcomeSreen(),

      },
      initialRoute: welcomeSreen.routeName,

    );
  }
}
