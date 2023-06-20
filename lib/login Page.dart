import 'package:flutter/material.dart';

import 'details_login.dart';

TextStyle myStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      onChanged: (val) {
        setState(() {
          username = val;
        });
      },
      style: myStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: "username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.3),
        ),
        prefixIcon: Icon(Icons.person),
      ),
    );

    final passwordField = TextField(
      onChanged: (val) {
        setState(() {
          password = val;
        });
      },
      obscureText: true,
      style: myStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: Icon(Icons.remove_red_eye),
        prefixIcon: Icon(Icons.lock),
      ),
    );

    final loginButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueGrey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        onPressed: () {

            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DetailsLogin (username: username, platform: '',),),);

        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/lion2.jpg'),
                ),
                SizedBox(height: 40),
                usernameField,
                SizedBox(height: 30),
                passwordField,
                SizedBox(height: 40),
                loginButton,
                SizedBox(height: 27),
                Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.brown, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
