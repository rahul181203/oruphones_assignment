import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CarousalButton extends StatelessWidget {
  const CarousalButton({super.key, required this.boxColor, required this.text, required this.button_color, required this.button_text, required this.text_color});
  final Color boxColor;
  final String text;
  final Color button_color;
  final Color text_color;
  final String button_text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 170,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Text(
            text,
            softWrap: true,
            style: TextStyle(
              color: text_color,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: button_color,
            ),
            onPressed: (){},
            child: Text(
              button_text,
              style: TextStyle(
                  color: boxColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}
