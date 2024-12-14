import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final Map<dynamic, dynamic> response;
  const HomeScreen({super.key, required this.response});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  Map<String, dynamic> responseBody = {};

  Future<Map<String, dynamic>> getdata() async {
    final String baseUrl =
        'https://test.vehup.com/api/vendor/get-total-vehicles';
    var token = widget.response['token'];

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        setState(() {
          responseBody = jsonDecode(response.body);
        });
        return responseBody;
      } else {
        return {"success": false, "message": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      return {"success": false, "message": "Error: $e"};
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    if (responseBody.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: const Icon(Icons.sort),
          actions: [const Icon(Icons.notifications_none)],
        ),
        body: const Center(
            child:
                CircularProgressIndicator()), // Loading indicator while fetching data
      );
    }

    List dataList = responseBody['data'] ?? [];

    return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cardwidget(
                  image: 'assets/icon1.png',
                  text: dataList.isNotEmpty
                      ? '${dataList.length}'
                      : '0', // Display number of items
                  description: 'total Vecile',
                ),
                const SizedBox(width: 10),
                const Cardwidget(
                  image: 'assets/icon2.png',
                  text: "50",
                  description: 'Total bookings',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cardwidget(
                  image: 'assets/icon3.png',
                  text: "25",
                  description: 'C2B concept',
                ),
                SizedBox(width: 10),
                Cardwidget(
                  image: 'assets/icon4.png',
                  text: "35",
                  description: 'Vehicle for sale',
                ),
              ],
            ),
          ],
        ),
      
      
    );
  }
}

// Custom Card widget to display information
class Cardwidget extends StatelessWidget {
  final String image;
  final String text;
  final String description;

  const Cardwidget({
    super.key,
    required this.image,
    required this.text,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(2, 2))],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      height: 170,
      width: 170,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image), // Display the image
            Text(text), // Display the text (number of items)
            Text(description), // Display the description
          ],
        ),
      ),
    );
  }
}
 
class Home extends StatelessWidget {
  const Home({super.key});

 @override
  Widget build(BuildContext context) {
    return Container(
       
        child: const Center(
            child:
                CircularProgressIndicator()), // Loading indicator while fetching data
      );
  
  }
}class Messages extends StatelessWidget {
  const Messages({super.key});

 @override
  Widget build(BuildContext context) {
    return Container(
       
        child: const Center(
            child:
                CircularProgressIndicator()), // Loading indicator while fetching data
      );
  
  }
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       
        child: const Center(
            child:
                CircularProgressIndicator()), // Loading indicator while fetching data
      );
  
  }
}