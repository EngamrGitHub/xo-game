
import 'package:flutter/material.dart';
import 'package:xo_game/widget/select_item.dart';

class welcomeSreen extends StatelessWidget {
  const welcomeSreen({super.key});
  static const String routeName = '/welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body:Container(
             padding: EdgeInsets.symmetric(horizontal:9),
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: [Color(0xff00D2FF), Color(0xff3A7BD5)],
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
               ),
             ),
             child:  Column(
                 children: [
                   Image.asset('assets/images/Group 4.png'),
                   SizedBox(height: 29,),
                   Text(
                       'Pick who goes first?',
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.w500,
                       color: Colors.white
                     ),
                   ),
                   SizedBox(height: 20,),
                   Row(
                     children: [
                       SelectItem(imageName: 'x'),
                       SizedBox(width: 5,),
                       SelectItem(imageName: 'o'),
                     ],
                   )
                 ],
               ),
             ),



    );
  }
}
