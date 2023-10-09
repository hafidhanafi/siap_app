import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class FormNaikPangkatPolriPage extends StatefulWidget {
  @override
  _FormNaikPangkatPolriPage createState() => _FormNaikPangkatPolriPage();
}

class _FormNaikPangkatPolriPage extends State<FormNaikPangkatPolriPage> {
  String id_user = "";
  TextEditingController drhController = TextEditingController();
  TextEditingController skepKepangkatanPertamaController = TextEditingController();
  TextEditingController skepKepangkatanTerakhirController = TextEditingController();
  TextEditingController skepPenetapanGajiTerakhirController = TextEditingController();
  TextEditingController skepPengangkatanPertamaPerwiraController = TextEditingController();
  TextEditingController skepJabatanTerakhirPerwiraController = TextEditingController();
  TextEditingController sprinlakJabatanTerakhirPerwiraController = TextEditingController();
  TextEditingController ijazahDiktukController = TextEditingController();
  TextEditingController ijazahDikbangController = TextEditingController();
  TextEditingController ijazahDikumController = TextEditingController();
  TextEditingController skhpController = TextEditingController();
  TextEditingController sklubdController = TextEditingController();
  TextEditingController sipkController = TextEditingController();


  String drhPath = "";
  String skepKepangkatanPertamaPath = "";
  String skepKepangkatanTerakhirPath = "";
  String skepPenetapanGajiTerakhirPath = "";
  String skepPengangkatanPertamaPerwiraPath = "";
  String skepJabatanTerakhirPerwiraPath = "";
  String sprinlakJabatanTerakhirPerwiraPath = "";
  String ijazahDiktukPath = "";
  String ijazahDikBangPath = "";
  String ijazahDikumPath = "";
  String skhpPath = "";
  String sklubdPath = "";
  String sipkPath = "";

  TextEditingController NamedrhPath = TextEditingController();
  TextEditingController NameSkepKepangkatanPertamaPath = TextEditingController();
  TextEditingController NameSkepKepangkatanTerakhirPath = TextEditingController();
  TextEditingController NameSkepPenetapanGajiTerakhirPath = TextEditingController();
  TextEditingController NameSkepPengangkatanPertamaPerwiraPath = TextEditingController();
  TextEditingController NameSkepJabatanTerakhirPerwiraPath = TextEditingController();
  TextEditingController NameSprinlakJabatanTerakhirPerwiraPath = TextEditingController();
  TextEditingController NameIjazahDiktukPath = TextEditingController();
  TextEditingController NameIjazahDikBangPath = TextEditingController();
  TextEditingController NameIjazahDikumPath = TextEditingController();
  TextEditingController NameSkhpPath = TextEditingController();
  TextEditingController NameSklubdPath = TextEditingController();
  TextEditingController NameSipkPath = TextEditingController();






  // File fileUpload = [];

  Future<void> _uploadFileDrh() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        drhPath = result.files.single.path!;
        NamedrhPath.text = result.files.single.name;
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
  Future<void> _uploadFileSkepKepangkatanTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepKepangkatanTerakhirPath = result.files.single.path!;
        NameSkepKepangkatanTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepPenetapanGajiTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepPenetapanGajiTerakhirPath = result.files.single.path!;
        NameSkepPenetapanGajiTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepPengangkatanPertamaPerwira() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepPengangkatanPertamaPerwiraPath = result.files.single.path!;
        NameSkepPengangkatanPertamaPerwiraPath.text = result.files.single.name;
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
        skepJabatanTerakhirPerwiraPath = result.files.single.path!;
        NameSkepJabatanTerakhirPerwiraPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSprinlakJabatanTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        sprinlakJabatanTerakhirPerwiraPath = result.files.single.path!;
        NameSprinlakJabatanTerakhirPerwiraPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }

  Future<void> _uploadFileIjazahDiktuk() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        ijazahDiktukPath = result.files.single.path!;
        NameIjazahDiktukPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileIjazahDikBang() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        ijazahDikBangPath = result.files.single.path!;
        NameIjazahDikBangPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileIjazahDikum() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        ijazahDikumPath = result.files.single.path!;
        NameIjazahDikumPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkhp() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skhpPath = result.files.single.path!;
        NameSkhpPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSklbdu() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        sklubdPath = result.files.single.path!;
        NameSklubdPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileNilaiSipk() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        sipkPath = result.files.single.path!;
        NameSipkPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }


  Future<void> ajukan() async{
    final url = Uri.parse('https://haver.my.id/api-services/public/api/v1/admin/pengajuanNaikPangkatPolri'); // Replace with your server URL
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
        "status_fitur": "1",
        "status_user": user['status_user'],
        "drhText": drhController.text,
        "skepKepangkatanPertamaText": skepKepangkatanPertamaController.text,
        "skepKepangkatanTerakhirText": skepKepangkatanTerakhirController.text,
        "skepPengangkatanPertamaPerwiraText": skepPengangkatanPertamaPerwiraController.text,
        "skepJabatanTerakhirPerwiraText": skepJabatanTerakhirPerwiraController.text,
        "sprinlakJabatanTerakhirPerwiraText": sprinlakJabatanTerakhirPerwiraController.text,
        "IjazahDiktukText": ijazahDiktukController.text,
        "IjazahDikbangText": ijazahDikbangController.text,
        "IjazahDikumText": ijazahDikumController.text,
        "skhpText": skhpController.text,
        "sklubdText": sklubdController.text
      });


      if (drhPath != "") {
        File fileDrh = File(drhPath);
        request.files.add(
          http.MultipartFile(
            'drhFile',
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
      if (skepKepangkatanTerakhirPath != "") {
        File fileKarpeg = File(skepKepangkatanTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'skepKepangkatanTerakhirFile',
            fileKarpeg.readAsBytes().asStream(),
            fileKarpeg.lengthSync(),
            filename: fileKarpeg.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepPengangkatanPertamaPerwiraPath != "") {
        File fileCapeg = File(skepPengangkatanPertamaPerwiraPath);
        request.files.add(
          http.MultipartFile(
            'skepPengangkatanPertamaPerwiraFile',
            fileCapeg.readAsBytes().asStream(),
            fileCapeg.lengthSync(),
            filename: fileCapeg.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepJabatanTerakhirPerwiraPath != "") {
        File filePengangkatan = File(skepJabatanTerakhirPerwiraPath);
        request.files.add(
          http.MultipartFile(
            'skepJabatanTerakhirPerwiraFile',
            filePengangkatan.readAsBytes().asStream(),
            filePengangkatan.lengthSync(),
            filename: filePengangkatan.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (sprinlakJabatanTerakhirPerwiraPath != "") {
        File fileSkepPangkatTerakhir = File(sprinlakJabatanTerakhirPerwiraPath);
        request.files.add(
          http.MultipartFile(
            'sprinlakJabatanTerakhirPerwiraFile',
            fileSkepPangkatTerakhir.readAsBytes().asStream(),
            fileSkepPangkatTerakhir.lengthSync(),
            filename: fileSkepPangkatTerakhir.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }

      if (ijazahDiktukPath != "") {
        File fileDiktuk = File(ijazahDiktukPath);
        request.files.add(
          http.MultipartFile(
            'ijazahDiktukFile',
            fileDiktuk.readAsBytes().asStream(),
            fileDiktuk.lengthSync(),
            filename: fileDiktuk.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (ijazahDikBangPath != "") {
        File fileDikBang = File(ijazahDikBangPath);
        request.files.add(
          http.MultipartFile(
            'ijazahDikBangFile',
            fileDikBang.readAsBytes().asStream(),
            fileDikBang.lengthSync(),
            filename: fileDikBang.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (ijazahDikumPath != "") {
        File fileDikum = File(ijazahDikumPath);
        request.files.add(
          http.MultipartFile(
            'ijazahDikumFile',
            fileDikum.readAsBytes().asStream(),
            fileDikum.lengthSync(),
            filename: fileDikum.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skhpPath != "") {
        File fileBap = File(skhpPath);
        request.files.add(
          http.MultipartFile(
            'skhpFile',
            fileBap.readAsBytes().asStream(),
            fileBap.lengthSync(),
            filename: fileBap.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (sklubdPath != "") {
        File fileBap = File(sklubdPath);
        request.files.add(
          http.MultipartFile(
            'sklubdFile',
            fileBap.readAsBytes().asStream(),
            fileBap.lengthSync(),
            filename: fileBap.path
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
                'Form Naik Pangkat Pns',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: drhController,
                decoration: InputDecoration(
                  hintText: 'Nomor Daftar Riwayat Hidup',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamedrhPath,
                decoration: InputDecoration(
                  hintText: 'Upload Daftar Riwayat Hidup',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileDrh(),
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
                controller: skepKepangkatanTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Kepangakatan Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepKepangkatanTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Kepangkatan Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepKepangkatanTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepPenetapanGajiTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Penetapan Gaji Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepPenetapanGajiTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Penetapan Gaji Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepPenetapanGajiTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepPengangkatanPertamaPerwiraController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Pengangkatan Pertama (perwira)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepPengangkatanPertamaPerwiraPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Pengangkatan Pertama (perwira)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepPengangkatanPertamaPerwira(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepJabatanTerakhirPerwiraController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Jabatan Terakhir (Perwira)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepJabatanTerakhirPerwiraPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Jabatan Terakhir (perwira)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepJabatanTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skhpController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keterangan Hasil Penelitian',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkhpPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keterangan Hasil Penelitian',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkhp(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: ijazahDiktukController,
                decoration: InputDecoration(
                  hintText: 'Nomor Ijazah Diktuk',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameIjazahDiktukPath,
                decoration: InputDecoration(
                  hintText: 'Upload Ijazah Diktuk',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileIjazahDiktuk(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: ijazahDikbangController,
                decoration: InputDecoration(
                  hintText: 'Nomor Ijazah DikBang',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameIjazahDikBangPath,
                decoration: InputDecoration(
                  hintText: 'Upload Ijazah DikBang',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileIjazahDikBang(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: ijazahDikumController,
                decoration: InputDecoration(
                  hintText: 'Nomor Ijazah Pendidikan Umum',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameIjazahDikumPath,
                decoration: InputDecoration(
                  hintText: 'Upload Ijazah Pendidikan Umum',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileIjazahDikum(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: sprinlakJabatanTerakhirPerwiraController,
                decoration: InputDecoration(
                  hintText: 'Nomor Sprinlak Jabatan Terakhir (Perwira)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSprinlakJabatanTerakhirPerwiraPath,
                decoration: InputDecoration(
                  hintText: 'Upload Sprinlak Jabatan Terakhir (Perwira)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSprinlakJabatanTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: sklubdController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keterangan Lulus Uji Bela Diri (Tamtama, Bintara, Pama, Pamen)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSklubdPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keterangan Lulus Uji Bela Diri (Tamtama, Bintara, Pama, Pamen)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSklbdu(),
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