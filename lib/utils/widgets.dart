import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key,required this.text,});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        top: 8,
      ),
      child: Text(text,
        style: TextStyle(
          color: ColorConstants.text_color,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class Scroll extends StatelessWidget {
  const Scroll({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children,
      ),
    );
  }
}

