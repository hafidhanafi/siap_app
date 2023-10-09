import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class LogoutPage extends StatefulWidget {
  @override
  _LogoutPage createState() => _LogoutPage();
}

class _LogoutPage extends State<LogoutPage> {
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  String id_user = "";

  @override
  void initState() {
    super.initState();
    LogoutConfirm();
  }

  // File fileUpload = [];

  Future<void> LogoutConfirm() async{
    _showMessageAlert(context, "Notifikasi", "Apakah Anda Ingin Keluar ?");
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Registration Page'),
      // ),
      body: null,
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //
      //         Text(
      //           'Apakah Anda Yakin Akan Keluar Aplikasi',
      //           style: TextStyle(
      //             fontSize: 15,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         ElevatedButton(
      //           onPressed: () {
      //             // Implement your login logic here
      //             // _showMessageAlert(context);
      //             // Navigator.pushNamed(context, '/home');
      //             loginSend(context);
      //           },
      //           child: Text('Login'),
      //           style: ElevatedButton.styleFrom(
      //             padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}