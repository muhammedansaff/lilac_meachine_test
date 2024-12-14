import 'dart:convert';

import 'package:first_app/bootombar.dart';
import 'package:first_app/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _message = '';
Future<Map<String, dynamic>> vendorLogin(String email, String password) async {

  final String baseUrl = 'https://test.vehup.com/api/vendor-login';


  Map<String, String> requestBody = {
    "email": email,
    "password": password,
  };

  try {
   
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json', // Set content type to JSON
      },
      body: jsonEncode(requestBody), // Convert the body to JSON format
    );

    // Check the status code of the response
    if (response.statusCode == 200) {
      // If the server responds with a 200 status, parse the JSON response body
      Map<String, dynamic> responseBody = jsonDecode(response.body);

      
      return responseBody;
    } else {
     
      return {
        "success": false,
        "message": "Failed to login, status code: ${response.statusCode}"
      };
    }
  } catch (e) {
    // Handle any errors that occur during the request (e.g., network issues)
    return {
      "success": false,
      "message": "Error: $e",
    };
  }
}

 
  void _login() async {
  setState(() {
    _isLoading = true; 
  });

  String email = _emailController.text;
  String password = _passwordController.text;


  var response = await vendorLogin(email, password);

  setState(() {
    _isLoading = false; // Hide loading indicator

    if (response["code"] == 200) {
  
      _message = 'Login successful!';
      
    } else {

      _message = response["message"];
    }
  });
  if(_message=='Login Successfully'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bootombar(response: response,)));
               }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset('assets/logo2.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Login With Your Email & \n            Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
             const Align(
              alignment: Alignment.centerLeft,
              child: Text('Email'),
            ),
            TextField(controller: _emailController,
              decoration: InputDecoration(focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF4A101D),width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(
                    Icons.mail_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your email'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              child: Text('Password'),
              alignment: Alignment.centerLeft,
            ),
            TextField(controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF4A101D),width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Align(
              child: const Text(
                'Forgot password',
                style: TextStyle(color:Color(0xFF4356FF)),
              ),
              alignment: Alignment.centerRight,
            ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(const Color(0xFF4A101D)),
                shape: WidgetStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)), // Set border radius to 5
                  ),
                ),
              ),
              onPressed: () {
               _login();
               
              },
              child: Center(
                child:_isLoading?const CircularProgressIndicator(): const Text("Login",style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
            text: const TextSpan(
              children: [
                // First part in black (Don't have an account?)
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                // Second part in blue (Register)
                TextSpan(
                  text: "Register",
                  style: TextStyle(color: Color(0xFF4356FF), fontSize: 16),
                ),
                
              ],
            ),
          ),  const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}



