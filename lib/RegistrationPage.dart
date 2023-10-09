import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPage createState() => _RegistrationPage();
}


class _RegistrationPage extends State<RegistrationPage> {
  List<dynamic> items = [
    {"status_user": "", "nama_status":"-- Pilih Status User --"},
    {"status_user": "1", "nama_status":"PNS"},
    {"status_user": "2", "nama_status":"Polri"}];

  String selectedItem = "";
  String selectStatusUser = "";
  TextEditingController nip = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController retypePassword = TextEditingController();
TextEditingController statusUser = TextEditingController();


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

  Future<void> register (context) async{

    final String endpoint = 'https://haver.my.id/api-services/public/api/v1/register';

    if(password.text == retypePassword.text){
      final Map<String,String> headers = {'Content-Type':'application/json'};

      try {
        final response = await http.post(
          Uri.parse(endpoint),
          headers: headers,
          body: jsonEncode({
            "nip": nip.text,
            "password": password.text,
            "status_user": selectStatusUser,
            "username" : username.text
          }),
        );
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (response.statusCode == 200) {
          // Successful POST request
          // final responseData = jsonDecode(response.body);
          if(responseData['responseCode'] == "00"){
            // final prefs = await SharedPreferences.getInstance();
            // prefs.setString("token", responseData['responseData']['token']);
            // prefs.setString("user", jsonEncode(responseData['responseData']['user']));
            // prefs.setString("user_data", jsonEncode(responseData['responseData']['user_data']));
            // Navigator.pushNamed(context, '/home');
            _showMessageAlert(context, "Notifikasi !!!", "Registrasi Berhasil Silahkan Login");
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
    }else{
      _showMessageAlert(context, "Notifikasi !", "Password Tidak Sesuai");
    }

    // print(result);
    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json', // Specify content type as JSON
    // };

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Registration Page'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nip,
                decoration: InputDecoration(
                  hintText: 'NIP/NRP',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: retypePassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Retype Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              DropdownButtonFormField(
                value: selectStatusUser,
                decoration: InputDecoration(
                  hintText: 'Status User',
                  prefixIcon: Icon(Icons.select_all),
                ),
                onChanged: (newValue) {
                  // _showMessageAlert(context, "select", newValue);
                    setState(() {
                      selectStatusUser = newValue!;
                    });



                },
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item['status_user'],
                    child: Text(item['nama_status']),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your registration logic here
                  register(context);
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an account? '),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/login');
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                      // Navigate to the login page or implement your logic here
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}