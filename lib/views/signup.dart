import 'package:flutter/material.dart';
import 'package:signup_signin_app/servces/auth.dart';
import 'package:signup_signin_app/views/home.dart';
import 'package:signup_signin_app/views/signin.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  
  AuthMethods authMethods = new AuthMethods();

  final keys = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  
  signUpMethod(){
    if(keys.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      authMethods.signup(_email.text, _password.text).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomeScreen()
          )
        );
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20.0),
        child: isLoading ? 
          Container(
            child:Center(
              child: CircularProgressIndicator(),
            ) 
          )
        : SingleChildScrollView(
          child: Form(
            key: keys,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign Up", 
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _username,
                    validator: (val){
                      if(val.isEmpty){
                        return "Username can't be empty";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Username",
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _email,
                    validator: (val){
                      if(val.isEmpty){
                        return "Email can't be empty";
                      }else if(!RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(val)){
                        return "Invalid Email Id";
                      }
                      
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
                    validator: (val){
                      if(val.isEmpty){
                        return "Password can't be empty";
                      }else if(val.length < 6){
                        return "Password Should be 6 Digit";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  width: 370.0,
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text('Submit', style: TextStyle(
                      fontSize: 17.0,
                    ),),
                    onPressed: (){
                      signUpMethod();
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already SignUp? ", 
                        style: TextStyle(
                          fontSize: 17.0
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => SignInScreen()
                            )
                          );
                        },
                        child: Text('SignIn Now', 
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17.0
                          ),
                        ),
                      )
                    ],  
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}