
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praticejson/login%20Page.dart';

void main()=> runApp(LoginPage());

class DetailsLogin extends StatelessWidget {
   DetailsLogin({
     required this.username
});

  final String username;


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('home page',
        style: TextStyle(color: Colors.black, fontSize: 20),
        ),),
      body: Column(

        children: [
          SizedBox(
            height: 26,),
          Text("Welcome" + username, style: TextStyle(fontSize: 25),),

        ],
      ),
    );
  }
}
