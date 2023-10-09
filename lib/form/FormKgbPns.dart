import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class FormKgbPnsPage extends StatefulWidget {
  @override
  _FormKgbPnsPage createState() => _FormKgbPnsPage();
}

class _FormKgbPnsPage extends State<FormKgbPnsPage> {
  String id_user = "";
  TextEditingController nilaiPrestasiKerjaPnsTerakhirController = TextEditingController();
  TextEditingController skepKepangkatanPertamaController = TextEditingController();
  TextEditingController skepKenaikanPangkatTerakhirController = TextEditingController();
  TextEditingController skepJabatanTerakhirController = TextEditingController();
  TextEditingController suratPemberitahuanKenaikanGajiBerkalaController = TextEditingController();




  String nilaiPrestasiKerjaPnsTerakhirPath = "";
  String skepKepangkatanPertamaPath = "";
  String skepKenaikanPangkatTerakhirPath = "";
  String skepJabatanTerakhirPath = "";
  String suratPemberitahuanKenaikanGajiBerkalaPath = "";



  TextEditingController NameNilaiPrestasiKerjaPnsTerakhirPath = TextEditingController();
  TextEditingController NameSkepKepangkatanPertamaPath = TextEditingController();
  TextEditingController NameSkepKenaikanPangkatTerakhirPath = TextEditingController();
  TextEditingController NameJabatanTerakhirPath = TextEditingController();
  TextEditingController NameSuratPemberitahuanKenaikanGajiBerkalaPath = TextEditingController();









  // File fileUpload = [];

  Future<void> _uploadFileNilaiPrestasiKerjaPnsTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        nilaiPrestasiKerjaPnsTerakhirPath = result.files.single.path!;
        NameNilaiPrestasiKerjaPnsTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepKepangkatanPertama() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepKepangkatanPertamaPath = result.files.single.path!;
        NameSkepKepangkatanPertamaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepKenaikanPangkatTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepKenaikanPangkatTerakhirPath = result.files.single.path!;
        NameSkepKenaikanPangkatTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepJabatanTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepJabatanTerakhirPath = result.files.single.path!;
        NameJabatanTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratPemberitahuanGajiBerkala() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratPemberitahuanKenaikanGajiBerkalaPath = result.files.single.path!;
        NameSuratPemberitahuanKenaikanGajiBerkalaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }




  Future<void> ajukan() async{
    final url = Uri.parse('https://haver.my.id/api-services/public/api/v1/admin/pengajuanKgbPns'); // Replace with your server URL
    // _showMessageAlert(context, "Notifikasi !!!", "jalan");

    final prefs = await SharedPreferences.getInstance();
    final resPref = prefs.getString("user");
    final token = prefs.getString("token");

    final Map<String, dynamic> user = jsonDecode(resPref!);
    // Create a multipart request
    try {
      final request = http.MultipartRequest('POST', url);

      request.headers['Authorization'] = 'Bearer $token';


      // request.fields.addAll({
      //   "id_user": user['id_user'],
      //   "status_fitur": "1",
      //   "input[]": "1|${drhController.text}",
      //   "input[]": "2|${dskpController.text}",
      //   "input[]": "3|${KarpegController.text}",
      //   "input[]": "4|${CapegPertamaController.text}",
      //   "input[]": "5|${PengangkatanController.text}",
      //   "input[]": "6|${SkepPangkatTerakhirController.text}",
      //   "input[]": "7|${SkhpController.text}",
      //   "input[]": "8|${IjazahDiktukController.text}",
      //   "input[]": "9|${IjazahDikbangController.text}",
      //   "input[]": "10|${IjazahDikumController.text}",
      //   "input[]": "11|${SkepJabatanController.text}",
      //   "input[]": "12|${BapController.text}",
      // });


      request.fields.addAll({
        "id_user": user['id_user'],
        "status_fitur": "2",
        "status_user": user['status_user'],
        "nilaiPrestasiKerjaPnsTerakhirText": nilaiPrestasiKerjaPnsTerakhirController.text,
        "skepKepangkatanPertamaText": skepKepangkatanPertamaController.text,
        "skepKenaikanPangkatTerakhirText": skepKenaikanPangkatTerakhirController.text,
        "skepJabatanTerakhirText": skepJabatanTerakhirController.text,
        "suratPemberitahuanKenaikanGajiBerkalaText": suratPemberitahuanKenaikanGajiBerkalaController.text
      });


      if (nilaiPrestasiKerjaPnsTerakhirPath != "") {
        File fileDrh = File(nilaiPrestasiKerjaPnsTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'nilaiPrestasiKerjaPnsTerakhirFile',
            fileDrh.readAsBytes().asStream(),
            fileDrh.lengthSync(),
            filename: fileDrh.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepKepangkatanPertamaPath != "") {
        File fileDskp = File(skepKepangkatanPertamaPath);
        request.files.add(
          http.MultipartFile(
            'skepKepangkatanPertamaFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepKenaikanPangkatTerakhirPath != "") {
        File fileDskp = File(skepKenaikanPangkatTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'skepKenaikanPangkatTerakhirFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepJabatanTerakhirPath != "") {
        File fileDskp = File(skepJabatanTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'skepJabatanTerakhirFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratPemberitahuanKenaikanGajiBerkalaPath != "") {
        File fileDskp = File(suratPemberitahuanKenaikanGajiBerkalaPath);
        request.files.add(
          http.MultipartFile(
            'suratPemberitahuanKenaikanGajiBerkalaFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }


      final response = await http.Response.fromStream(await request.send());
      // _showMessageAlert(context, "Notifikasi !!!", response.body.toString());
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful upload
        // print('File uploaded successfully.');
        // print('Response: ${response.body}');
        // final responseData = jsonDecode(response.body);
        _showMessageAlert(
            context, "Notifikasi !!!", responseData['responseMessage']);
      } else {
        // Handle the error
        // print('Error uploading file and JSON: ${response.statusCode}');
        _showMessageAlert(context, "Notifikasi !!!", "${response.statusCode}");
      }
    }catch(e){
      _showMessageAlert(context, "Notifikasi !!!", "${e}");
    }
    // _showMessageAlert(context, "Notifikasi !!!", "${response.statusCode}");

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kembali'),
      ),
      body: Padding(
        // padding: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
        // child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Form Kgb Pns',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: nilaiPrestasiKerjaPnsTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Nilai Prestasi Kerja Pns',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameNilaiPrestasiKerjaPnsTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Nilai Prestasi Kerja Pns',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileNilaiPrestasiKerjaPnsTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepKepangkatanPertamaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Kepangkatan Pertama',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepKepangkatanPertamaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Kepangkatan Pertama',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepKepangkatanPertama(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepKenaikanPangkatTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Kenaikan Pangkat Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepKenaikanPangkatTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Kenaikan Pangkat Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepKenaikanPangkatTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepJabatanTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Jabatan Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameJabatanTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Jabatan Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepJabatanTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Implement your registration logic here
                        // updateProfile(context);
                        ajukan();
                      },
                      child: Text('Ajukan'),
                      style: ElevatedButton.styleFrom(

                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      ),
                    ),
                  ]
              ),


            ],
          ),
        ),

        // ),

      ),
    );
  }
}