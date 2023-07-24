import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oruphones_assignment/screens/home_screen.dart';
import '../constants/UrlConstants.dart';


class ApiConnect{

  static Future getListings()async{
    var response = await http.get(
        Uri.parse(UrlConstants.getListings(1,10)),
    );
    var data = jsonDecode(response.body);
    return data;
  }

  static Future<void> getSearch(String value) async{
    var response = await http.post(
      Uri.parse(UrlConstants.searchModel),
      body: {
        "searchModel":value
      },
    );
    final data = jsonDecode(response.body);
    HomeScreen.query_results = data["models"];
  }
}