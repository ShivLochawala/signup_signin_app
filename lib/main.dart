import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_signin_app/views/signup.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp'),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("SignUp"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>SignUpScreen(),
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
*/