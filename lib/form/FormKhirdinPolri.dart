import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class FormKhirdinPolriPage extends StatefulWidget {
  @override
  _FormKhirdinPolriPage createState() => _FormKhirdinPolriPage();
}

class _FormKhirdinPolriPage extends State<FormKhirdinPolriPage> {
  String id_user = "";
  TextEditingController drhController = TextEditingController();
  TextEditingController suratNikahController = TextEditingController();
  TextEditingController kpiKpsController = TextEditingController();
  TextEditingController suratKeteranganPesertaAsabriController = TextEditingController();
  TextEditingController npwpController = TextEditingController();
  TextEditingController skepPengangkatanPertamaController = TextEditingController();
  TextEditingController skepPengangkatanTerakhirController = TextEditingController();
  TextEditingController suratPernyataanPensiunController = TextEditingController();
  TextEditingController daftarSusunanKeluargaController = TextEditingController();
  TextEditingController passFotoPakaianPdhController = TextEditingController();
  TextEditingController passFotoIstriController = TextEditingController();
  TextEditingController keputusanTandaJasaController = TextEditingController();



  String drhPath = "";
  String suratNikahPath = "";
  String kpiKpsPath = "";
  String suratKeteranganPesertaAsabriPath = "";
  String npwpPath = "";
  String skepPengangkatanPertamaPath = "";
  String skepPengangkatanTerakhirPath = "";
  String suratPernyataanPensiunPath = "";
  String daftarSusunanKeluargaPath = "";
  String passFotoPakaianPdhPath = "";
  String passFotoIstriPath = "";
  String keputusanTandaJasaPath = "";


  TextEditingController NamedrhPath = TextEditingController();
  TextEditingController NameSuratNikahPath = TextEditingController();
  TextEditingController NameKpiKpsPath = TextEditingController();
  TextEditingController NameSuratKeteranganPesertaAsabriPath = TextEditingController();
  TextEditingController NameNpwpPath = TextEditingController();
  TextEditingController NameSkepPengangkatanPertamaPath = TextEditingController();
  TextEditingController NameSkepPengangkatanTerakhirPath = TextEditingController();
  TextEditingController NameSuratPernyataanPensiunPath = TextEditingController();
  TextEditingController NameDaftarSusunanKeluargaPath = TextEditingController();
  TextEditingController NamePassFotoPakaianPdhPath = TextEditingController();
  TextEditingController NamePassFotoIstriPath = TextEditingController();
  TextEditingController NameKeputusanTandaJasaPath = TextEditingController();








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
  Future<void> _uploadFileSuratNikah() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratNikahPath = result.files.single.path!;
        NameSuratNikahPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileKpiKps() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        kpiKpsPath = result.files.single.path!;
        NameKpiKpsPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratKeteranganAsabri() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratKeteranganPesertaAsabriPath = result.files.single.path!;
        NameSuratKeteranganPesertaAsabriPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileNpwp() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        npwpPath = result.files.single.path!;
        NameNpwpPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepPengangkatanPertama() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepPengangkatanPertamaPath = result.files.single.path!;
        NameSkepPengangkatanPertamaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepPengangkatanTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        skepPengangkatanTerakhirPath = result.files.single.path!;
        NameSkepPengangkatanTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratPernyataanPensiun() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratPernyataanPensiunPath = result.files.single.path!;
        NameSuratPernyataanPensiunPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileDaftarSusunanKeluarga() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        daftarSusunanKeluargaPath = result.files.single.path!;
        NameDaftarSusunanKeluargaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFilePassFotoPakaianPdh() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        passFotoPakaianPdhPath = result.files.single.path!;
        NamePassFotoPakaianPdhPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFilePassFotoIstri() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        passFotoIstriPath = result.files.single.path!;
        NamePassFotoIstriPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileKeputusanTandaJasa() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        passFotoIstriPath = result.files.single.path!;
        NamePassFotoIstriPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }



  Future<void> ajukan() async{
    final url = Uri.parse('https://haver.my.id/api-services/public/api/v1/admin/pengajuanKhirdinPolri'); // Replace with your server URL
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
        "status_fitur": "3",
        "status_user": user['status_user'],
        "drhText": drhController.text,
        "suratNikahText": suratNikahController.text,
        "kpiKpsText": kpiKpsController.text,
        "suratKeteranganPesertaAsabriText": suratKeteranganPesertaAsabriController.text,
        "npwpText": npwpController.text,
        "sKepPengangkatanPertamaText": skepPengangkatanPertamaController.text,
        "sKepPengangkatanTerakhirText": skepPengangkatanTerakhirController.text,
        "suratPernyataanPensiunText": suratPernyataanPensiunController.text,
        "daftarSusunanKeluargaText": daftarSusunanKeluargaController.text,
        "passFotoPakaianPdhText": passFotoPakaianPdhController.text,
        "passfotoIstriText": passFotoIstriController.text,
        "keputusanTandaJasaText": keputusanTandaJasaController.text
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
      if (suratNikahPath != "") {
        File fileDskp = File(suratNikahPath);
        request.files.add(
          http.MultipartFile(
            'suratNikahFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (kpiKpsPath != "") {
        File fileDskp = File(kpiKpsPath);
        request.files.add(
          http.MultipartFile(
            'kpiKpsFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratKeteranganPesertaAsabriPath != "") {
        File fileDskp = File(suratKeteranganPesertaAsabriPath);
        request.files.add(
          http.MultipartFile(
            'suratKeteranganPesertaAsabriFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (npwpPath != "") {
        File fileDskp = File(npwpPath);
        request.files.add(
          http.MultipartFile(
            'npwpFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepPengangkatanPertamaPath != "") {
        File fileDskp = File(skepPengangkatanPertamaPath);
        request.files.add(
          http.MultipartFile(
            'sKepPengangkatanPertamaFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (skepPengangkatanTerakhirPath != "") {
        File fileDskp = File(skepPengangkatanTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'sKepPengangkatanTerakhirFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratPernyataanPensiunPath != "") {
        File fileDskp = File(suratPernyataanPensiunPath);
        request.files.add(
          http.MultipartFile(
            'suratPernyataanPensiunFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (daftarSusunanKeluargaPath != "") {
        File fileDskp = File(daftarSusunanKeluargaPath);
        request.files.add(
          http.MultipartFile(
            'daftarSusunanKeluargaFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (passFotoPakaianPdhPath != "") {
        File fileDskp = File(passFotoPakaianPdhPath);
        request.files.add(
          http.MultipartFile(
            'passFotoPakaianPdhFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (passFotoIstriPath != "") {
        File fileDskp = File(passFotoIstriPath);
        request.files.add(
          http.MultipartFile(
            'passfotoIstriFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (keputusanTandaJasaPath != "") {
        File fileDskp = File(keputusanTandaJasaPath);
        request.files.add(
          http.MultipartFile(
            'keputusanTandaJasaPathFile',
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
                'Form Pensiun Pns',
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
                controller: suratNikahController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Nikah',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratNikahPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Nikah',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratNikah(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: kpiKpsController,
                decoration: InputDecoration(
                  hintText: 'Nomor KPI/KPS',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameKpiKpsPath,
                decoration: InputDecoration(
                  hintText: 'Upload KPI/KPS',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKpiKps(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratKeteranganPesertaAsabriController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keterangan Peserta ASABRI',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratKeteranganPesertaAsabriPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keterangan Peserta ASABRI',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratKeteranganAsabri(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: npwpController,
                decoration: InputDecoration(
                  hintText: 'Nomor NPWP',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameNpwpPath,
                decoration: InputDecoration(
                  hintText: 'Upload Npwp',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileNpwp(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepPengangkatanPertamaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Pengangkatan Pertama',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepPengangkatanPertamaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Pengangkatan Pertama',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepPengangkatanPertama(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: skepPengangkatanTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Pengangkatan Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepPengangkatanTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Pengangkatan Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepPengangkatanTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratPernyataanPensiunController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Pernyataan Pensiun',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratPernyataanPensiunPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Pernyataan Pensiun',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratPernyataanPensiun(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: daftarSusunanKeluargaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Daftar Susunan Keluarga',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameDaftarSusunanKeluargaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Daftar Susunan Keluarga',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileDaftarSusunanKeluarga(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: passFotoPakaianPdhController,
                decoration: InputDecoration(
                  hintText: 'Nomor Pass Foto Pakaian PDH',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamePassFotoPakaianPdhPath,
                decoration: InputDecoration(
                  hintText: 'Upload Pass Foto Pakaian PDH',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFilePassFotoPakaianPdh(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: passFotoIstriController,
                decoration: InputDecoration(
                  hintText: 'Nomor Pass Foto Istri',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamePassFotoIstriPath,
                decoration: InputDecoration(
                  hintText: 'Upload Pass Foto Istri',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFilePassFotoIstri(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: keputusanTandaJasaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Keputusan Tanda Jasa',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameKeputusanTandaJasaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Keputusan Tanda Jasa',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKeputusanTandaJasa(),
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