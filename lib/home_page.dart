import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praticejson/caculator.dart';
import 'package:praticejson/product_details_screen.dart';
import 'package:praticejson/search.dart';

import 'login Page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List  jsonData = [];

  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      jsonData = data["item"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Hello Flutter"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      //     Image.asset(
      //     'assets/bananas.jpg',
      //     height: 300,
      //     cacheWidth: 300,
      //   ),
      //   SizedBox(height: 5
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(10),
      //     child: Container(
      //       alignment: Alignment.topCenter,
      //       child: ElevatedButton(
      //         onPressed: readJsonFile,
      //         child: Text("Load data"),
      //       ),
      //     ),
      //   ),
      // jsonData.isNotEmpty ?  Expanded(
      //     child: ListView.builder(
      //       itemCount: jsonData.length,
      //       shrinkWrap: true,
      //       itemBuilder: (context, index) {
      //         return Card(
      //           margin: const EdgeInsets.all(10),
      //           child: ListTile(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => ProductDetailsScreen(
      //                     id: jsonData[index]["id"],
      //                     name: jsonData[index]["name"],
      //                     description: jsonData[index]["description"],
      //                   ),
      //                 ),
      //               );
      //             },
      //             leading: CircleAvatar(
      //               child: Text(jsonData[index]["id"].toString()),
      //             ),
      //             title: Text(jsonData[index]["name"]),
      //             subtitle: Text(jsonData[index]["description"]),
      //           ),
      //         );
      //       },
      //     ),
      //   ): const SizedBox(),
    //     Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: Column(
    //         children: [
    //           ElevatedButton(
    //             onPressed: () {
    //               // Navigate to the photo view page
    //             },
    //             child: Container(
    //               alignment: Alignment.center,
    //               child: Text("View the photo"),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: Column(
    //         children: [
    //           ElevatedButton(
    //             onPressed: () {
    //               // Load products
    //             },
    //             child: Container(
    //               alignment: Alignment.center,
    //               child: Text("Load products"),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: Column(
    //         children: [
    //           ElevatedButton(
    //             onPressed: () {
    //               // Save data
    //             },
    //             child: Container(
    //               alignment: Alignment.center,
    //               child: Text("Save data"),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Price the product"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> CalculatorScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Calculator"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage ()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("LoginPage"),
                ),
              ),
            ],
          ),
        ),
          ],
        ),
    );
  }
}
