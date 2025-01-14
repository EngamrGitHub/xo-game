import 'package:flutter/material.dart';
import 'package:xo_game/gamescreen.dart'; // تأكد من أن هذا المسار صحيح

class SelectItem extends StatelessWidget {
  final String imageName;
  SelectItem({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            gameScreen.routeName,
            arguments: imageName,
          );
        },
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(29),
          ),
          child: Image.asset('assets/images/${imageName}.png'), // عرض الصورة بناءً على imageName
        ),
      ),
    );
  }
}
