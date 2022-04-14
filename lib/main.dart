import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:videocalling_finalproject/screens/home_screen.dart';
import 'package:videocalling_finalproject/screens/login_screen.dart';
import 'package:videocalling_finalproject/utils/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        title: 'Flutter Video Call',
        routes:{
          '/login' : (context) => const LoginScreen(),
          '/home' : (context) => const HomeScreen(),
        },
        home: const LoginScreen(),
    );
  }


}

