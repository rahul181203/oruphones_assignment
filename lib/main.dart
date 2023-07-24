import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/firebase/firebase_api.dart';
import 'package:oruphones_assignment/screens/notification_screen.dart';
import 'screens/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: HomeScreen(),
      routes: {
        NotificationScreen.notification:(context) => const NotificationScreen(),
      },
    );
  }
}
