
import 'package:flutter/material.dart';
import 'package:praticejson/product_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "image":
      "https://im.rediff.com/300-3![](../assets/mango.jpg)00/movies/2019/oct/14neeraj-madhav2.jpg",
      "id": 1,
      "name": "Dr. Manu Kumar",
      "des": "Co-founder & CEO @ ",
    },
    {
      "id": 2,
      "name": "BL Kumawat",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png",
    },
    {
      "id": 3,
      "name": "Rohit Kumar",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://sa1s3optim.patientpop.com/assets/images/provider/photos/1888657.jpg",
    },
    {
      "id": 4,
      "name": "Mitesh Raj",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LmG47_W3RM0QBVGI23-vodL_oOOJxLIBrg&usqp=CAU",
    },
    {
      "id": 5,
      "name": "Dr. Manu Kumar",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://img.freepik.com/free-photo/black-man-city_1157-17027.jpg?w=2000",
    },
    {
      "id": 6,
      "name": "Deno James",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://media.gettyimages.com/photos/portrait-of-smiling-mid-adult-man-wearing-tshirt-picture-id985138674?s=612x612",
    },
    {
      "id": 7,
      "name": "Kaviraj Patil",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://image.shutterstock.com/image-photo/handsome-young-man-running-across-260nw-587931092.jpg",
    },
    {
      "id": 8,
      "name": "Raja Ram",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://media.istockphoto.com/photos/portrait-of-young-happy-indian-business-man-executive-looking-at-picture-id1309489745?b=1&k=20&m=1309489745&s=170667a&w=0&h=Wo_7nESC_ePyEYfEsnOm-rP6ElkxbWqIB3Ga4W3nw8M=",
    },
    {
      "id": 9,
      "name": "Caversky",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://media.istockphoto.com/photos/young-man-looking-at-digital-tablet-picture-id1184382530?k=20&m=1184382530&s=612x612&w=0&h=-G67wR9BU2-XqLTR70purl0vb2PFbu3OAg0T7O_ZpiI=",
    },
    {
      "id": 10,
      "name": "Becky",
      "des": "Co-founder & CEO @ ",
      "image":
      "https://e0.365dm.com/22/06/2048x1152/skysports-erling-haaland-man-city_5803257.jpg",
    },

  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

// This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 15, 0),
                    height: 50,
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      // Use onChanged instead of onChange
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(100, 50, 50, 50),
                        contentPadding:
                        EdgeInsets.only(top: 10, bottom: 20),
                        // Added missing comma
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                          color: Color.fromARGB(250, 50, 50, 50),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(150, 800, 800, 800),
                        ),
                      ),
                    ),
                  ),
                  _foundUsers.isNotEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _foundUsers.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        Card(
                          elevation: 1,
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsScreen(

                                  name: _foundUsers[index]['name'],
                                  description: _foundUsers[index]["des"],
                                  urlImage: _foundUsers[index]["image"],
                              )));
                            },
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  _foundUsers[index]['image']),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(_foundUsers[index]['name']),
                            subtitle: Text('${_foundUsers[index]["des"]}'),
                          ),
                        ),
                  )
                      : Center(
                    child: Text(
                      'No results found. Please try with a different search.',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}