import 'package:flutter/material.dart';
import 'package:siap_app_new/HomePage.dart';
import 'package:siap_app_new/LoginPage.dart';
import 'package:siap_app_new/Logout.dart';
import 'package:siap_app_new/PengajuanPage.dart';
import 'package:siap_app_new/ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';




class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int _selectedIndex = 0;

  // List of views or pages for each tab
  final List<Widget> _pages = [
    // Add your pages here
    HomePage(),
    // Placeholder(),
    PengajuanPage(),
    ProfilePage(),
    // LogoutPage()
  ];
  void _showMessageAlert(BuildContext context, title, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                // Navigator.of(context).pop();
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.clear();
                // Navigator.pushReplacementNamed(context, "/login");
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
              },


              child: Text('Logout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    if(index == 3){
      _showMessageAlert(context, "Notifikasi", "Apakah Anda Yakin Akan Logout");
    }else{
      setState(() {
        _selectedIndex = index;
      });
    }

    // () {
    //   _selectedIndex = index;
    // };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My App Home'),
      // ),

      body:_pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.black38,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pengajuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}