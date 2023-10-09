import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:siap_app_new/widgets/doctor_item.dart';

import 'package:siap_app_new/widgets/specialist_item.dart';
import 'package:http/http.dart' as http;
import 'package:siap_app_new/firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status_user = "-";
  String nama_user = "";
  String id_user="";
  List<dynamic> pengajuan = [];

  @override
  void initState() {
    super.initState();
    getPrefs();
    getPengajuan();
    setupInteractedMessage();

  }

  Future<void> getPrefs() async{
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getString("user");
    final resData = prefs.getString("user_data");
    final Map<String, dynamic> user = jsonDecode(res!);

    final Map<String, dynamic> userData = jsonDecode(resData!);
    // if(resData == null){
    //   _showMessageAlert(context, "Notifikasi", userData);
      // Navigator.pushNamed(context, '/home');
    // }
    setState(() {
      status_user = user['status_user'];
      id_user = user['id_user'];
      if(userData != null){
        nama_user = userData['nama_lengkap'];
      }
    });
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

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      _showMessageAlert(context, "Notifikasi", message.data['type']);
    }
  }

  List<Widget> getPengajuanList() {
    List<Widget> childs = [];
    if(pengajuan.length > 0){
      for (var i = 0; i < pengajuan.length; i++) {
        // childs.add(new ListItem('abcd ' + $i));
        childs.add(new DoctorItem(id_pengajuan: pengajuan[i]['id_pengajuan'], nama_pengajuan: pengajuan[i]['nama_pengajuan'], jenis_pengajuan: pengajuan[i]['nama_fitur'], status_pengajuan: pengajuan[i]['nama_kode_status'], jabatan_pengajuan: pengajuan[i]['jabatan_pengajuan'], tanggal_pengajuan: pengajuan[i]['tanggal_pengajuan']));
      }
    }else{
      childs.add(new DoctorItem(id_pengajuan: "Tidak Ada Pengajuan", nama_pengajuan: "-", jenis_pengajuan: "-", status_pengajuan: "-", jabatan_pengajuan: "-", tanggal_pengajuan: "-"));
    }

    return childs;
  }
  Future<void> getPengajuan() async {
    final prefs = await SharedPreferences.getInstance();
    final String endpoint = 'https://haver.my.id/api-services/public/api/v1/admin/getPengajuan';

    // print(result);
    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json', // Specify content type as JSON
    // };

    final resPref = prefs.getString("user");
    final token = prefs.getString("token");

    final Map<String, dynamic> result = jsonDecode(resPref!);

    final Map<String,String> headers = {
      'Authorization' : 'Bearer ${token}',
      'Content-Type' : 'application/json'
    };
    try {

      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode({
          "id_user": result['id_user'],
          "limit" : 5
        }),
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
        if(responseData['responseCode'] == "00"){
          setState(() {
            pengajuan = responseData['responseData'];
          });
        }
      } else {
        // Handle errors here, e.g., show an error message
        _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
      }
    } catch (e) {
      // Handle exceptions, e.g., network issues
      _showMessageAlert(context, "Notifikasi !!!", "${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${nama_user}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],

                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          "https://haver.my.id/api-services/public/getPhoto/${(id_user != "")?id_user:"999999"}", // Replace with your image URL
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(156, 154, 154, 154),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/surgeon.png",
                        width: 92,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "S.I.A.P",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const SizedBox(
                            width: 120,
                            child: Text(
                              "Sistem Informasi Administrasi Personel",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 150,
                            height: 35,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: const Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(95, 179, 173, 173),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        size: 32,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "How can we help you?",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: ListView(

                    scrollDirection: Axis.horizontal,
                    children: [
                      SpecialistItem(
                        imagePath: "assets/clean.png",
                        imageName: "Naik Pangkat",
                        status_user: status_user,
                        status_fitur : "1",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SpecialistItem(
                        imagePath: "assets/knife.png",
                        imageName: "Kgb",
                        status_user: status_user,
                        status_fitur : "2",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SpecialistItem(
                        imagePath: "assets/lungs.png",
                        imageName: "Pensiun",
                        status_user: status_user,
                        status_fitur : "3",
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "List Pengajuan Terbaru",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: getPengajuanList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}