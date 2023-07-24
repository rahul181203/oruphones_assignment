import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/constants/colors.dart';
import 'package:oruphones_assignment/constants/list_constants.dart';
import 'package:http/http.dart' as http;
import '../constants/UrlConstants.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}


class _FilterScreenState extends State<FilterScreen> {
  List<Widget> total = [];
  List<String> filter_names = ["make","condition","storage","ram"];
  List<dynamic> lists = [ListConstants.make,ListConstants.condition,ListConstants.storage,ListConstants.ram];

  Future<void> loadData()async{
    var response = await http.get(
      Uri.parse(UrlConstants.getFilters(true)),
    );
    var data = jsonDecode(response.body);

    int num = 0;
    for(var i in data["filters"].keys){
      for(var e in data["filters"][i]){
        lists[num].add({"item":e,"isChecked":false});
      }
      num++;
    }
    for(int i=0;i<lists.length;i++){
      total.add(Text(filter_names[i],
        style: TextStyle(
            color: ColorConstants.primary_color,
            fontWeight: FontWeight.bold),
        ),
      );
      for(var e in lists[i]){
        total.add(CheckboxListTile(
          title: Text(e["item"]),
            value: e["isChecked"],
            onChanged: (value){

            })
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget makeDismissible({required Widget child}) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: GestureDetector(onTap: (){},child: child,),
    );

    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder:(_,controller) => Container(
          color: ColorConstants.pure_white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future:loadData(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return ListView(
                    controller: controller,
                    children: total,
                  );
                }else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            )
          ),
        ),
      ),
    );
  }
}

