import 'package:flutter/material.dart';
import 'package:oruphones_assignment/screens/home_screen.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("search component");
    return ListView.builder(
      itemCount: HomeScreen.query_results.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(HomeScreen.query_results.elementAt(index)),
            ),
          );
        }
    );
  }
}
