
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siap_app_new/firebase_options.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController nipController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Function to show a message alert'

  @override
  void initState(){
    checkSession();
  }

  Future<void> checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString("token");
    final user = await prefs.getString("user");
    if(token != null || user != null){
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
  }



  void _showMessageAlert(BuildContext context, title, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> loginSend(context) async {

    // final Map<String, String> data = {
    //   'nip': nipController.text,
    //   'password': passwordController.text
    // };
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final fcmToken = await FirebaseMessaging.instance.getToken();
    // _showMessageAlert(context, "N", fcmToken);
    // print(fcmToken);
    final String endpoint = 'https://haver.my.id/api-services/public/api/v1/login';

    // print(result);
    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json', // Specify content type as JSON
    // };
    final Map<String,String> headers = {'Content-Type':'application/json'};

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode({
          "nip": nipController.text,
          "password": passwordController.text,
          "devices_id": fcmToken
        }),
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful POST request
        // final responseData = jsonDecode(response.body);
        if(responseData['responseCode'] == "00"){
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("token", responseData['responseData']['token']);
          prefs.setString("user", jsonEncode(responseData['responseData']['user']));
          prefs.setString("user_data", jsonEncode(responseData['responseData']['user_data']));
          // Navigator.pushNamed(context, '/home');
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
          _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
        }else{
          _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
        }

      } else {
        // Error handling for unsuccessful request
        // print('POST request failed with status code ${response.statusCode}');
        // print('Response data: ${response.body}');
        _showMessageAlert(context, "Notifikasi 1 !!!", '${response.statusCode}');
        // final Map<String, dynamic> responseData = jsonDecode(response.body);
        // return Map<String, dynamic> jsonDecode(response.body);
      }
    } catch (e) {
      // Exception handling
      // print('Error: $e');
      _showMessageAlert(context, "Notifikasi 2 !!!", '${e}');
    }


  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/logo.png"),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'NIP/NRP',
                  prefixIcon: Icon(Icons.numbers_sharp),
                ),
                controller: nipController,
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                controller: passwordController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your login logic here
                  // _showMessageAlert(context);
                  // Navigator.pushNamed(context, '/home');
                  loginSend(context);
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Implement your registration logic here
                  // Navigator.pushNamed(context, '/register');
                  Navigator.of(context).pushNamedAndRemoveUntil('/register', (route) => false);
                },
                child: Text('Create an Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
