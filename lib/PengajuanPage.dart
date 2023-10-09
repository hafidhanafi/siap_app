import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siap_app_new/widgets/doctor_item.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class PengajuanPage extends StatefulWidget {
  @override
  _PengajuanPage createState() => _PengajuanPage();
}

class _PengajuanPage extends State<PengajuanPage> {
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  String id_user = "";

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();

  }


  DateTime selectedDate = DateTime.now();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController tmtPangkatController = TextEditingController();
  TextEditingController kgbController = TextEditingController();
  TextEditingController pathController = TextEditingController();

  TextEditingController pangkatSelect = TextEditingController();

  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nip = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  TextEditingController tahunMasuk = TextEditingController();

  // TextEditingController kgbController = TextEditingController();
  List<dynamic> dataPengajuan = [];



  // File fileUpload = [];


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

  Future<void> fetchDataFromApi() async {
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
          "id_user": result['id_user']
        }),
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
        if(responseData['responseCode'] == "00"){
          setState(() {
            dataPengajuan = responseData['responseData'];
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

  List<Widget> getPengajuanList() {
    List<Widget> childs = [];
    if(dataPengajuan.length > 0){
      for (var i = 0; i < dataPengajuan.length; i++) {
        // childs.add(new ListItem('abcd ' + $i));
        childs.add(new DoctorItem(id_pengajuan: dataPengajuan[i]['id_pengajuan'], nama_pengajuan: dataPengajuan[i]['nama_pengajuan'], jenis_pengajuan: dataPengajuan[i]['nama_fitur'], status_pengajuan: dataPengajuan[i]['nama_kode_status'], jabatan_pengajuan: dataPengajuan[i]['jabatan_pengajuan'], tanggal_pengajuan: dataPengajuan[i]['tanggal_pengajuan']));
      }
    }else{
      childs.add(new DoctorItem(id_pengajuan: "Tidak Ada Pengajuan", nama_pengajuan: "Tidak Ada Pengajuan", jenis_pengajuan: "Tidak Ada Pengajuan", status_pengajuan: "Tidak Ada Pengajuan", jabatan_pengajuan: "Tidak Ada Pengajuan", tanggal_pengajuan: "Tidak Ada Pengajuan"));
    }

    return childs;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Registration Page'),
      // ),
      body: Padding(
        // padding: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        // child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: getPengajuanList(),
            ),
          )
        ),

        // ),

      ),
    );
  }
}