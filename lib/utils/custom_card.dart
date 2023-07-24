import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.text, required this.path});
  final String text;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      margin: EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorConstants.pure_white,
      ),
      child: Column(
          children: [
            Image.asset("images/$path",cacheWidth: 55,),
            SizedBox(height: 15,),
            Text(text,textAlign: TextAlign.center,)
          ],
      ),
    );
  }
}
