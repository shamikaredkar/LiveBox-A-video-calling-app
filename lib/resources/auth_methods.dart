import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:videocalling_finalproject/utils/utils.dart';
class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  signInWithGoogle(BuildContext context) async{
    bool res = false;
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credentials);

      User? user = userCredential.user;

      if(user!=null){
        //if user has just logged in to the application
        if(userCredential.additionalUserInfo!.isNewUser){
          //create new collection with following document in firestore
          await _firestore.collection('users').doc(user.uid).set({
            'username' : user.displayName,
            'uid' : user.uid,
            'profilePhoto' : user.photoURL
          });
        }
      res = true;
      }
    }
     catch(e){
        debugPrint(e.toString());
      // showSnackBar(context,e.message!);
        res = false;
    }
  }

}

