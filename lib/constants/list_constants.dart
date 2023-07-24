import 'package:flutter/material.dart';
import 'package:oruphones_assignment/constants/colors.dart';
import 'package:oruphones_assignment/utils/carousal_button.dart';

class ListConstants{
  static List<String> logo = [
    "apple_logo.png",
    "samsung_logo.png",
    "mi_logo.png",
    "vivo_logo.jpg",
    "oneplus_logo.png",
    "oppo_logo.png",
    "motorola_logo.png",
    "realme_logo.png",
    // "Show All"
  ];

  static List<Widget> carousal_list = [
    Stack(
      children: [
        Image.asset("images/carousal_pic_1.webp",
            fit: BoxFit.fill,
            width: double.infinity),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarousalButton(
                boxColor: ColorConstants.primary_color,
                  text: "Sell your phone in few steps",
                  button_color: ColorConstants.secondary_color,
                  button_text: "Sell Now +",
                  text_color: ColorConstants.pure_white,
              ),
              CarousalButton(
                boxColor: ColorConstants.pure_white,
                text: "Buy your dream phone in few steps",
                button_color: ColorConstants.primary_color,
                button_text: "Buy Now >",
                text_color: ColorConstants.primary_color,
              ),
            ],
          ),
        ),
      ],
    ),
    Image.asset("images/carousal_pic_3.webp",
        fit: BoxFit.fill,
        width: double.infinity),
    Image.asset("images/carousal_pic_4.webp",
        fit: BoxFit.fill,
        width: double.infinity)
  ];

  static List<Map<String,String>> shop_by = [
    {
      "text":"BestSelling Mobiles",
      "path":"best-selling-mobiles.png"
    },
    {
      "text":"Verified Devices Only",
      "path":"verified-mobils.png"
    },
    {
      "text":"Like New Condition",
      "path":"like-new.png"
    },
    {
      "text":"Phones with Warrenty",
      "path":"warranty.png"
    },
    {
      "text":"Shop By Price",
      "path":"price.png"
    }
  ];

  static List<dynamic> make = [];
  static List<dynamic> condition = [];
  static List<dynamic> ram = [];
  static List<dynamic> storage = [];


}