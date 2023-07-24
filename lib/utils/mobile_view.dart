import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key, required this.path, required this.price, required this.name, required this.storage, required this.condition, required this.location, required this.date, required this.path2, required this.path3});
  final String path;
  final String path2;
  final String path3;
  final String price;
  final String name;
  final String storage;
  final String condition;
  final String location;
  final String date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.35,
      // margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 0.1),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Icon(Icons.favorite_border_outlined,
              color: Colors.red,
              size: 32,
            ),
            alignment: Alignment.topRight,
          ),
          Center(child: Image.network(path,cacheWidth: 100,
            cacheHeight: 100,
          errorBuilder: (context,error,stackTrace){
            return Image.network(path2,cacheWidth: 100,
              cacheHeight: 100,
            errorBuilder: (context,error,stackTrace){
              return Image.network(
                path3,
                cacheWidth: 100,
                cacheHeight: 100,);
            },);
          },
          )),
          SizedBox(height: 10,),
          Text("'\u{20B9} $price",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          Text(name,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Text(storage,
                softWrap: false,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text("Condition: $condition",
                softWrap: false,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Text(location,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(date,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
