import 'package:flutter/material.dart';
import 'package:videocalling_finalproject/resources/auth_methods.dart';
import 'package:videocalling_finalproject/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text("Start or Join the meeting",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),

          Padding(padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(text: 'Google SignIn',onPressed: ()async{
            bool res = await _authMethods.signInWithGoogle(context);
            if (res) {
              Navigator.pushNamed(context, '/home');
            };
          },),
        ],
      ) ,
    );
  }
}
