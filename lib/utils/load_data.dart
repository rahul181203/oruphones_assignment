import 'package:flutter/material.dart';
import 'package:oruphones_assignment/screens/home_screen.dart';
import '../constants/colors.dart';
import '../constants/list_constants.dart';
import 'custom_card.dart';


class DataLoading{
  static void get_brands(){
    for(var i in ListConstants.logo){
      HomeScreen.logo_brands.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          margin: EdgeInsets.all(8),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorConstants.pure_white,
          ),
          child: Image.asset("images/$i"),
        ),
      );
    };
  }

  static void load_shopby(){
    for(var i in ListConstants.shop_by){
      HomeScreen.shop_by.add(CardComponent(text: i["text"]!, path: i["path"]!));
    }
  }
}