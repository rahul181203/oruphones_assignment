import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oruphones_assignment/constants/UrlConstants.dart';
import 'package:oruphones_assignment/constants/colors.dart';
import 'package:oruphones_assignment/network/apis.dart';
import 'package:oruphones_assignment/screens/filter_screen.dart';
import 'package:oruphones_assignment/screens/notification_screen.dart';
import 'package:oruphones_assignment/utils/casrousal.dart';
import 'package:http/http.dart' as http;
import 'package:oruphones_assignment/utils/load_data.dart';
import 'package:oruphones_assignment/utils/search_component.dart';
import 'package:oruphones_assignment/utils/widgets.dart';
import '../utils/mobile_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static List<Widget> mobiles = [];
  static List<dynamic> query_results = [];
  static List<Widget> logo_brands = [];
  static List<Widget> shop_by = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  final controller_text = TextEditingController();

  int page = 1;
  bool isLoading = false;
  bool searchmode = false;

  Future fetch() async{
    const limit = 10;
    final url = Uri.parse(UrlConstants.getListings(page, limit));
    final response = await http.get(url);
    if(response.statusCode == 200){
      final newItems = jsonDecode(response.body);
      setState(() {
        page++;
        for(var i in newItems["listings"]){
          HomeScreen.mobiles.add(
              MobileView(
                path: i["defaultImage"]["fullImage"],
                path2: i["images"][0]["fullImage"],
                path3: i["images"][1]["fullImage"],
                price: i["listingNumPrice"].toString(),
                location: i["listingLocation"],
                name: i["model"],
                condition: i["deviceCondition"],
                storage: i["deviceStorage"],
                date: i["listingDate"],
              ),
          );
        };
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DataLoading.get_brands();
    DataLoading.load_shopby();
    controller.addListener(() {
      if(controller.position.maxScrollExtent == controller.offset){
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future refresh() async{
      setState(() {
        isLoading = false;
        page = 0;
        HomeScreen.mobiles.clear();
      });
      fetch();
    }

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10,
              right: 10,
              top: 3,
              bottom: 8,
            ),
            child: TextField(
              controller: controller_text,
              onTap: (){
                setState(() {
                  searchmode = true;
                });
              },
              onChanged: (value){
                ApiConnect.getSearch(value);
                print(HomeScreen.query_results);
                setState(() {
                  searchmode = true;
                });
              },
              decoration: InputDecoration(
                hintText: "Search with make and model..",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: (){
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    setState(() {
                      HomeScreen.query_results.clear();
                      searchmode = false;
                      controller_text.clear();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide.none
                ),
              filled: true,
                fillColor: ColorConstants.pure_white,
              contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        backgroundColor: ColorConstants.primary_color,
        leading: Icon(Icons.menu_outlined),
        title: Image.asset("images/logo_square.png",color: ColorConstants.pure_white,),
        actions: [
          Center(child: Text("India",style: TextStyle(color: ColorConstants.pure_white,),)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.location_on,color: ColorConstants.pure_white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed:(){
              Navigator.pushNamed(context, NotificationScreen.notification);
            },icon: Icon(Icons.notifications_none_outlined,color: ColorConstants.pure_white,)),
          ),
        ],
      ),
      body: (searchmode)?SearchComponent():RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          children: [
            HeadingText(text: "Shop By Brands"),
            Scroll(children: HomeScreen.logo_brands),
            const CarousalComponent(),
            HeadingText(text: "Shop By"),
            Scroll(children: HomeScreen.shop_by),
            Row(
              children: [
                HeadingText(text: "Best Deals Near You"),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InkWell(
                    child: Text("India",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        color: ColorConstants.secondary_color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ),
                ),
                Spacer(),
                IconButton(onPressed: (){
                  showModalBottomSheet(
                    useSafeArea: true,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => FilterScreen()
                  );
                },
                    icon: Icon(Icons.filter_list_sharp)),
              ],
            ),
            FutureBuilder(
              future: fetch(),
                builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MasonryGridView.count(
                    controller: controller,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: HomeScreen.mobiles.length+2,
                    itemBuilder: (BuildContext context, int index) {
                        if(index<HomeScreen.mobiles.length){
                          return HomeScreen.mobiles[index];
                        }else{
                            return Padding(
                               padding: EdgeInsets.symmetric(vertical: 32),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                            );
                        }
                    },
                  ),
                );
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
