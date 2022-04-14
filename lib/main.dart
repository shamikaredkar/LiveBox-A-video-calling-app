import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:videocalling_finalproject/resources/auth_methods.dart';
import 'package:videocalling_finalproject/screens/home_screen.dart';
import 'package:videocalling_finalproject/screens/login_screen.dart';
import 'package:videocalling_finalproject/screens/video_call_screen.dart';
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
          '/video-call' : (context) => const VideoCallScreen(),
        },
        home: StreamBuilder(
          stream : AuthMethods().authChanges,
          builder:(context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(),
                );
            }
            if(snapshot.hasData){
              return const HomeScreen();
            }
            return const LoginScreen();
          },

        ),
    );
  }


}

