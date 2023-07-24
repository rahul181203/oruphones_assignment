import 'package:flutter/material.dart';
import 'package:oruphones_assignment/constants/colors.dart';
import '../firebase/firebase_api.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static String notification = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primary_color,
        title: Text("Notification",style: TextStyle(color: ColorConstants.pure_white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: ColorConstants.pure_white,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListTile(
          title: Text("${FirebaseApi.mes_title}"),
          subtitle: Text("${FirebaseApi.mes_body}"),
          isThreeLine: true,
        ),
      ),
    );
  }
}
