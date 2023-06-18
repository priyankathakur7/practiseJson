import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final String description;
  final String urlImage;


     ProductDetailsScreen({

    Key? key,
    required this.name,
    required this.description,
       required this.urlImage,



  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View the Photo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
             CircleAvatar(

              backgroundImage: NetworkImage(
                widget.urlImage,
              ),
              radius: 200,
            ),
            Column(
              children: [
                Text(
                  'Name: ${widget.name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Description: ${widget.description}',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
