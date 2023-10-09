import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class FormNaikPangkatPnsPage extends StatefulWidget {
  @override
  _FormNaikPangkatPnsPage createState() => _FormNaikPangkatPnsPage();
}

class _FormNaikPangkatPnsPage extends State<FormNaikPangkatPnsPage> {
  String id_user = "";
  TextEditingController drhController = TextEditingController();
  TextEditingController dskpController = TextEditingController();
  TextEditingController KarpegController = TextEditingController();
  TextEditingController CapegPertamaController = TextEditingController();
  TextEditingController PengangkatanController = TextEditingController();
  TextEditingController SkepPangkatTerakhirController = TextEditingController();
  TextEditingController SkhpController = TextEditingController();
  TextEditingController IjazahDiktukController = TextEditingController();
  TextEditingController IjazahDikbangController = TextEditingController();
  TextEditingController IjazahDikumController = TextEditingController();
  TextEditingController SkepJabatanController = TextEditingController();
  TextEditingController BapController = TextEditingController();


  String drhPath = "";
  String dskpPath = "";
  String karpegPath = "";
  String CapegPertamaPath = "";
  String PengangkatanPath = "";
  String SkepPangkatTerakhirPath = "";
  String SkhpPath = "";
  String IjazahDiktukPath = "";
  String IjazahDikBangPath = "";
  String IjazahDikumPath = "";
  String SkepJabatanPath = "";
  String BapPath = "";

  TextEditingController NamedrhPath = TextEditingController();
  TextEditingController NamedskpPath = TextEditingController();
  TextEditingController NamekarpegPath = TextEditingController();
  TextEditingController NameCapegPertamaPath = TextEditingController();
  TextEditingController NamePengangkatanPath = TextEditingController();
  TextEditingController NameSkepPangkatTerakhirPath = TextEditingController();
  TextEditingController NameSkhpPath = TextEditingController();
  TextEditingController NameIjazahDiktukPath = TextEditingController();
  TextEditingController NameIjazahDikBangPath = TextEditingController();
  TextEditingController NameIjazahDikumPath = TextEditingController();
  TextEditingController NameSkepJabatanPath = TextEditingController();
  TextEditingController NameBapPath = TextEditingController();






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
  Future<void> _uploadFileDskp() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        dskpPath = result.files.single.path!;
        NamedskpPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileKarpeg() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        karpegPath = result.files.single.path!;
        NamekarpegPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileCapegPertama() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        CapegPertamaPath = result.files.single.path!;
        NameCapegPertamaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFilePengangkatan() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        PengangkatanPath = result.files.single.path!;
        NamePengangkatanPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepPangkatTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        SkepPangkatTerakhirPath = result.files.single.path!;
        NameSkepPangkatTerakhirPath.text = result.files.single.name;
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
        SkhpPath = result.files.single.path!;
        NameSkhpPath.text = result.files.single.name;
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
        IjazahDiktukPath = result.files.single.path!;
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
        IjazahDikBangPath = result.files.single.path!;
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
        IjazahDikumPath = result.files.single.path!;
        NameIjazahDikumPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSkepJabatan() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        SkepJabatanPath = result.files.single.path!;
        NameSkepJabatanPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileBap() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        BapPath = result.files.single.path!;
        NameBapPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }


  Future<void> ajukan() async{
    final url = Uri.parse('https://haver.my.id/api-services/public/api/v1/admin/pengajuanNaikPangkatPns'); // Replace with your server URL
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
        "dskpText": dskpController.text,
        "karpegText": KarpegController.text,
        "CapegPertamaText": CapegPertamaController.text,
        "PengangkatanText": PengangkatanController.text,
        "SkepPangkatTerakhirText": SkepPangkatTerakhirController.text,
        "SkhpText": SkhpController.text,
        "IjazahDiktukText": IjazahDiktukController.text,
        "IjazahDikbangText": IjazahDikbangController.text,
        "IjazahDikumText": IjazahDikumController.text,
        "SkepJabatanText": SkepJabatanController.text,
        "BapText": BapController.text
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
      if (dskpPath != "") {
        File fileDskp = File(dskpPath);
        request.files.add(
          http.MultipartFile(
            'dskpFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (karpegPath != "") {
        File fileKarpeg = File(karpegPath);
        request.files.add(
          http.MultipartFile(
            'karpegFile',
            fileKarpeg.readAsBytes().asStream(),
            fileKarpeg.lengthSync(),
            filename: fileKarpeg.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (CapegPertamaPath != "") {
        File fileCapeg = File(CapegPertamaPath);
        request.files.add(
          http.MultipartFile(
            'CapegPertamaFile',
            fileCapeg.readAsBytes().asStream(),
            fileCapeg.lengthSync(),
            filename: fileCapeg.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (PengangkatanPath != "") {
        File filePengangkatan = File(PengangkatanPath);
        request.files.add(
          http.MultipartFile(
            'PengangkatanFile',
            filePengangkatan.readAsBytes().asStream(),
            filePengangkatan.lengthSync(),
            filename: filePengangkatan.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (SkepPangkatTerakhirPath != "") {
        File fileSkepPangkatTerakhir = File(SkepPangkatTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'SkepPangkatTerakhirFile',
            fileSkepPangkatTerakhir.readAsBytes().asStream(),
            fileSkepPangkatTerakhir.lengthSync(),
            filename: fileSkepPangkatTerakhir.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (SkhpPath != "") {
        File fileSkhp = File(SkhpPath);
        request.files.add(
          http.MultipartFile(
            'SkhpFile',
            fileSkhp.readAsBytes().asStream(),
            fileSkhp.lengthSync(),
            filename: fileSkhp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (IjazahDiktukPath != "") {
        File fileDiktuk = File(IjazahDiktukPath);
        request.files.add(
          http.MultipartFile(
            'IjazahDiktukFile',
            fileDiktuk.readAsBytes().asStream(),
            fileDiktuk.lengthSync(),
            filename: fileDiktuk.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (IjazahDikBangPath != "") {
        File fileDikBang = File(IjazahDikBangPath);
        request.files.add(
          http.MultipartFile(
            'IjazahDikBangFile',
            fileDikBang.readAsBytes().asStream(),
            fileDikBang.lengthSync(),
            filename: fileDikBang.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (IjazahDikumPath != "") {
        File fileDikum = File(IjazahDikumPath);
        request.files.add(
          http.MultipartFile(
            'IjazahDikumFile',
            fileDikum.readAsBytes().asStream(),
            fileDikum.lengthSync(),
            filename: fileDikum.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (SkepJabatanPath != "") {
        File fileBap = File(SkepJabatanPath);
        request.files.add(
          http.MultipartFile(
            'SkepJabatanFile',
            fileBap.readAsBytes().asStream(),
            fileBap.lengthSync(),
            filename: fileBap.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (BapPath != "") {
        File fileBap = File(BapPath);
        request.files.add(
          http.MultipartFile(
            'files_upload[]',
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
                controller: dskpController,
                decoration: InputDecoration(
                  hintText: 'Nomor Daftar Sasaran Kerja Pegawai',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamedskpPath,
                decoration: InputDecoration(
                  hintText: 'Upload Daftar Sasaran Kerja Pegawai',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileDskp(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: KarpegController,
                decoration: InputDecoration(
                  hintText: 'Nomor Kartu Kepegawaian',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamekarpegPath,
                decoration: InputDecoration(
                  hintText: 'Upload Kartu Kepegawaian',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKarpeg(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: CapegPertamaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Capeg Pertama',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameCapegPertamaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Capeg Pertama',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileCapegPertama(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: PengangkatanController,
                decoration: InputDecoration(
                  hintText: 'Nomor Pengangkatan PNS',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamePengangkatanPath,
                decoration: InputDecoration(
                  hintText: 'Upload Pengangkatan PNS',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFilePengangkatan(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: SkepPangkatTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Pangkat Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepPangkatTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Pangkat Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepPangkatTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: SkhpController,
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
                controller: IjazahDiktukController,
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
                controller: IjazahDikbangController,
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
                controller: IjazahDikumController,
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
                controller: SkepJabatanController,
                decoration: InputDecoration(
                  hintText: 'Nomor Skep Jabatan',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSkepJabatanPath,
                decoration: InputDecoration(
                  hintText: 'Upload Skep Jabatan',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSkepJabatan(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: BapController,
                decoration: InputDecoration(
                  hintText: 'Nomor Berita Acara Pelantikan',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameBapPath,
                decoration: InputDecoration(
                  hintText: 'Upload Berita Acara Pelantikan',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileBap(),
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