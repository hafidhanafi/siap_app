import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siap_app_new/HomePage.dart';
import 'package:siap_app_new/LoginPage.dart';
import 'package:siap_app_new/NavigationPage.dart';
import 'package:siap_app_new/RegistrationPage.dart';
import 'package:siap_app_new/form/FormKgbPns.dart';
import 'package:siap_app_new/form/FormKgbPolri.dart';
import 'package:siap_app_new/form/FormKhirdinPns.dart';
import 'package:siap_app_new/form/FormKhirdinPolri.dart';
import 'package:siap_app_new/form/FormNaikPangkatPns.dart';
import 'package:siap_app_new/form/FormNaikPangkatPolri.dart';


void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final prefs = SharedPreferences.getInstance();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.I.A.P',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        '/login' : (context) => LoginPage(),
        '/register' : (context) => RegistrationPage(),
        '/home' : (context) => NavigationPage(),
        '/formNaikPangkatPns' : (context) => FormNaikPangkatPnsPage(),
        '/formNaikPangkatPolri' : (context) => FormNaikPangkatPolriPage(),
        '/formKhirdinPns' : (context) => FormKhirdinPnsPage(),
        '/formKhirdinPolri' : (context) => FormKhirdinPolriPage(),
        '/formKgbPns' : (context) => FormKgbPnsPage(),
        '/formKgbPolri' : (context) => FormKgbPolriPage()

      },
    );
  }
}


