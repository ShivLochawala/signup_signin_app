import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthMethods{

  Future<void> signup(String userEmail, String userPassword) async{
    try {
      UserCredential userCredential = await FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(
          email: userEmail, 
          password: userPassword
        );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signin(String userEmail, String userPassword) async{
    try {
      UserCredential userCredential = await FirebaseAuth
      .instance
      .signInWithEmailAndPassword(
        email: userEmail, 
        password: userPassword
      );
    } catch (e) {
      print(e.toString());
    }
  }
}

