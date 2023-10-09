import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class FormKhirdinPnsPage extends StatefulWidget {
  @override
  _FormKhirdinPnsPage createState() => _FormKhirdinPnsPage();
}

class _FormKhirdinPnsPage extends State<FormKhirdinPnsPage> {
  String id_user = "";
  TextEditingController drhController = TextEditingController();
  TextEditingController suratUsulanKasatkerController = TextEditingController();
  TextEditingController suratKeputusanPangkatTerakhirController = TextEditingController();
  TextEditingController suratKeputusanGajiTerakhirController = TextEditingController();
  TextEditingController suratNikahController = TextEditingController();
  TextEditingController karsuKarisController = TextEditingController();
  TextEditingController kartuTandaAsabriController = TextEditingController();
  TextEditingController suratKeteranganDariPimpinanSekolahController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController kkController = TextEditingController();
  TextEditingController aktaKelahiranAnakController = TextEditingController();
  TextEditingController suratPernyataanAlamatTerakhirController = TextEditingController();
  TextEditingController passFotoPakaianDinasController = TextEditingController();
  TextEditingController passFotoSuamiIstriController = TextEditingController();
  TextEditingController suratKeteranganPengembalianBarangMilikNegaraController = TextEditingController();
  TextEditingController suratPernyataanTidakDiJatuhiHukumanDisiplinController = TextEditingController();
  TextEditingController suratPernyataanTidakSedangProsesPidanaController = TextEditingController();
  TextEditingController tandaJasaController = TextEditingController();


  String drhPath = "";
  String suratUsulanKasatkerPath = "";
  String suratKeputusanPangkatTerakhirPath = "";
  String suratKeputusanGajiTerakhirPath = "";
  String suratNikahPath = "";
  String karsuKarisPath = "";
  String kartuTandaAsabriPath = "";
  String suratKeteranganDariPimpinanSekolahPath = "";
  String ktpPath = "";
  String kkPath = "";
  String aktaKelahiranAnakPath = "";
  String suratPernyataanAlamatTerakhirPath = "";
  String passFotoPakaianDinasPath = "";
  String passFotoSuamiIstriPath = "";
  String suratKeteranganPengembalianBarangMilikNegaraPath = "";
  String suratPernyataanTidakDiJatuhiHukumanDisiplinPath = "";
  String suratPernyataanTidakSedangProsesPidanaPath = "";
  String tandaJasaPath = "";


  TextEditingController NamedrhPath = TextEditingController();
  TextEditingController NameSuratUsulanKasatkerPath = TextEditingController();
  TextEditingController NameSuratKeputusanPangkatTerakhirPath = TextEditingController();
  TextEditingController NameSuratKeputusanGajiTerakhirPath = TextEditingController();
  TextEditingController NameSuratNikahPath = TextEditingController();
  TextEditingController NameKarsuKarisPath = TextEditingController();
  TextEditingController NameKartuTandaAsabriPath = TextEditingController();
  TextEditingController NameSuratKeteranganDariPimpinanSekolahPath = TextEditingController();
  TextEditingController NameKtpPath = TextEditingController();
  TextEditingController NameKkPath = TextEditingController();
  TextEditingController NameAktaKelahiranAnakPath = TextEditingController();
  TextEditingController NameSuratPernyataanAlamatTerakhirPath = TextEditingController();
  TextEditingController NamePassFotoPakaianDinasPath = TextEditingController();
  TextEditingController NamePassFotoSuamiIstriPath = TextEditingController();
  TextEditingController NameSuratKeteranganPengembalianBarangMilikNegaraPath = TextEditingController();
  TextEditingController NameSuratPernyataanTidakDiJatuhiHukumanDisiplinPath = TextEditingController();
  TextEditingController NameSuratPernyataanTidakSedangProsesPidanaPath = TextEditingController();
  TextEditingController NameTandaJasaPath = TextEditingController();







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
  Future<void> _uploadFileSuratUsulanKasatker() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratUsulanKasatkerPath = result.files.single.path!;
        NameSuratUsulanKasatkerPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratKeputusanPangkatTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratKeputusanPangkatTerakhirPath = result.files.single.path!;
        NameSuratKeputusanPangkatTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratKeputusanGajiTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratKeputusanGajiTerakhirPath = result.files.single.path!;
        NameSuratKeputusanGajiTerakhirPath.text = result.files.single.name;
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
  Future<void> _uploadFileKarsuKaris() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        karsuKarisPath = result.files.single.path!;
        NameKarsuKarisPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratKeteranganDariPimpinanSekolah() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratKeteranganDariPimpinanSekolahPath = result.files.single.path!;
        NameSuratKeteranganDariPimpinanSekolahPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileKtp() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        ktpPath = result.files.single.path!;
        NameKtpPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileKartuTandaAsabri() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        kartuTandaAsabriPath = result.files.single.path!;
        NameKartuTandaAsabriPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileKk() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        kkPath = result.files.single.path!;
        NameKkPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileAktaKelahiranAnak() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        aktaKelahiranAnakPath = result.files.single.path!;
        NameAktaKelahiranAnakPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratPernyataanAlamatTerakhir() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratPernyataanAlamatTerakhirPath = result.files.single.path!;
        NameSuratPernyataanAlamatTerakhirPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFilePassFotoPakaianDinas() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        passFotoPakaianDinasPath = result.files.single.path!;
        NamePassFotoPakaianDinasPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFilePassFotoSuamiIstri() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        passFotoSuamiIstriPath = result.files.single.path!;
        NamePassFotoSuamiIstriPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratKeteranganPengembalianBarangMilikNegara() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratKeteranganPengembalianBarangMilikNegaraPath = result.files.single.path!;
        NameSuratKeteranganPengembalianBarangMilikNegaraPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratPernyataanTidakDiJatuhiHukumanDisiplin() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratPernyataanTidakDiJatuhiHukumanDisiplinPath = result.files.single.path!;
        NameSuratPernyataanTidakDiJatuhiHukumanDisiplinPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileSuratPernyataanTidakSedangProsesPidana() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        suratPernyataanTidakSedangProsesPidanaPath = result.files.single.path!;
        NameSuratPernyataanTidakSedangProsesPidanaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }
  Future<void> _uploadFileTandaJasa() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        tandaJasaPath = result.files.single.path!;
        NameTandaJasaPath.text = result.files.single.name;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }



  Future<void> ajukan() async{
    final url = Uri.parse('https://haver.my.id/api-services/public/api/v1/admin/pengajuanKhirdinPns'); // Replace with your server URL
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
        "suratUsulanKasatkerText": suratUsulanKasatkerController.text,
        "suratKeputusanPangkatTerakhirText": suratKeputusanPangkatTerakhirController.text,
        "suratKeputusanGajiTerakhirText": suratKeputusanGajiTerakhirController.text,
        "suratNikahText": suratNikahController.text,
        "karsuKarisText": karsuKarisController.text,
        "kartuTandaAsabriText": kartuTandaAsabriController.text,
        "suratKeteranganDariPimpinanSekolahText": suratKeteranganDariPimpinanSekolahController.text,
        "ktpText": ktpController.text,
        "kkText": kkController.text,
        "aktaKelahiranAnakTextText": aktaKelahiranAnakController.text,
        "suratPernyataanAlamatTerakhirText": suratPernyataanAlamatTerakhirController.text,
        "passFotoPakaianDinasText" : passFotoPakaianDinasController.text,
        "passFotoSuamiIstriText" : passFotoSuamiIstriController.text,
        "suratKeteranganPengembalianBarangMilikNegaraText" : suratKeteranganPengembalianBarangMilikNegaraController.text,
        "suratPernyataanTidakDiJatuhiHukumanDisiplinText" : suratPernyataanTidakDiJatuhiHukumanDisiplinController.text,
        "suratPernyataanTidakSedangProsesPidana" : suratPernyataanTidakSedangProsesPidanaController.text,
        "tandaJasaText" : tandaJasaController.text


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
      if (suratUsulanKasatkerPath != "") {
        File fileDskp = File(suratUsulanKasatkerPath);
        request.files.add(
          http.MultipartFile(
            'suratUsulanKasatkerFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratKeputusanPangkatTerakhirPath != "") {
        File fileDskp = File(suratKeputusanPangkatTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'suratKeputusanPangkatTerakhirFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratKeputusanGajiTerakhirPath != "") {
        File fileDskp = File(suratKeputusanGajiTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'suratKeputusanGajiTerakhirFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
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
      if (karsuKarisPath != "") {
        File fileDskp = File(karsuKarisPath);
        request.files.add(
          http.MultipartFile(
            'karsuKarisFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (kartuTandaAsabriPath != "") {
        File fileDskp = File(kartuTandaAsabriPath);
        request.files.add(
          http.MultipartFile(
            'kartuTandaAsabriFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratKeteranganDariPimpinanSekolahPath != "") {
        File fileDskp = File(suratKeteranganDariPimpinanSekolahPath);
        request.files.add(
          http.MultipartFile(
            'suratKeteranganDariPimpinanSekolahFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (ktpPath != "") {
        File fileDskp = File(ktpPath);
        request.files.add(
          http.MultipartFile(
            'ktpFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (kkPath != "") {
        File fileDskp = File(kkPath);
        request.files.add(
          http.MultipartFile(
            'kkFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratPernyataanAlamatTerakhirPath != "") {
        File fileDskp = File(suratPernyataanAlamatTerakhirPath);
        request.files.add(
          http.MultipartFile(
            'suratPernyataanAlamatTerakhirFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (passFotoPakaianDinasPath != "") {
        File fileDskp = File(passFotoPakaianDinasPath);
        request.files.add(
          http.MultipartFile(
            'passFotoPakaianDinasFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (passFotoSuamiIstriPath != "") {
        File fileDskp = File(passFotoSuamiIstriPath);
        request.files.add(
          http.MultipartFile(
            'passFotoSuamiIstriFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratKeteranganPengembalianBarangMilikNegaraPath != "") {
        File fileDskp = File(suratKeteranganPengembalianBarangMilikNegaraPath);
        request.files.add(
          http.MultipartFile(
            'suratKeteranganPengembalianBarangMilikNegaraFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratPernyataanTidakDiJatuhiHukumanDisiplinPath != "") {
        File fileDskp = File(suratPernyataanTidakDiJatuhiHukumanDisiplinPath);
        request.files.add(
          http.MultipartFile(
            'suratPernyataanTidakDiJatuhiHukumanDisiplinFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      if (suratPernyataanTidakSedangProsesPidanaPath != "") {
        File fileDskp = File(suratPernyataanTidakSedangProsesPidanaPath);
        request.files.add(
          http.MultipartFile(
            'suratPernyataanTidakSedangProsesPidanaFile',
            fileDskp.readAsBytes().asStream(),
            fileDskp.lengthSync(),
            filename: fileDskp.path
                .split('/')
                .last, // Use the file name from the path
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }

      if (tandaJasaPath != "") {
        File fileKarpeg = File(tandaJasaPath);
        request.files.add(
          http.MultipartFile(
            'tandaJasaFile',
            fileKarpeg.readAsBytes().asStream(),
            fileKarpeg.lengthSync(),
            filename: fileKarpeg.path
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
                controller: suratUsulanKasatkerController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Usulan Kasatker',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratUsulanKasatkerPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Usulan Kasatker',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratUsulanKasatker(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratKeputusanPangkatTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keputusan Pangkat Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratKeputusanPangkatTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keputusan Pangkat Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratKeputusanPangkatTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratKeputusanGajiTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Surat Keputusan Gaji Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratKeputusanGajiTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keputusan Gaji Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratKeputusanGajiTerakhir(),
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
                controller: karsuKarisController,
                decoration: InputDecoration(
                  hintText: 'Nomor Karsu Karis',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameKarsuKarisPath,
                decoration: InputDecoration(
                  hintText: 'Upload Karsu Karis',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKarsuKaris(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: kartuTandaAsabriController,
                decoration: InputDecoration(
                  hintText: 'Nomor Kartu Tanda ASABRI',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameKartuTandaAsabriPath,
                decoration: InputDecoration(
                  hintText: 'Upload Kartu Tanda ASABRI',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKartuTandaAsabri(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratKeteranganDariPimpinanSekolahController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keterangan Dari Pimpinan Sekolah (Anak usia 21 - 25)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratKeteranganDariPimpinanSekolahPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keterangan Dari Pimpinan Sekolah (Anak usia 21 - 25)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratKeteranganDariPimpinanSekolah(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: ktpController,
                decoration: InputDecoration(
                  hintText: 'Nomor KTP Suami/Istri',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameKtpPath,
                decoration: InputDecoration(
                  hintText: 'Upload KTP Suami/Istri',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKtp(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: kkController,
                decoration: InputDecoration(
                  hintText: 'Nomor Kartu Keluarga',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameKkPath,
                decoration: InputDecoration(
                  hintText: 'Upload Kartu Keluarga',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileKk(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: aktaKelahiranAnakController,
                decoration: InputDecoration(
                  hintText: 'Nomor Akte Kelahiran Anak',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameAktaKelahiranAnakPath,
                decoration: InputDecoration(
                  hintText: 'Upload Akte Kelahiran Anak',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileAktaKelahiranAnak(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratPernyataanAlamatTerakhirController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Pernyataan Alamat Terakhir',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratPernyataanAlamatTerakhirPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Pernyataan Alamat Terakhir',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratPernyataanAlamatTerakhir(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: passFotoPakaianDinasController,
                decoration: InputDecoration(
                  hintText: 'Nomor Pass Foto Pakaian Dinas Pangkat Terakhir (Background Biru)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamePassFotoPakaianDinasPath,
                decoration: InputDecoration(
                  hintText: 'Upload Pass Foto Pakaian Dinas Pangkat Terakhir (Background Biru)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFilePassFotoPakaianDinas(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: passFotoSuamiIstriController,
                decoration: InputDecoration(
                  hintText: 'Nomor Pass Foto Suami/Istri',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NamePassFotoSuamiIstriPath,
                decoration: InputDecoration(
                  hintText: 'Upload Pass Foto Suami/Istri',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFilePassFotoSuamiIstri(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratKeteranganPengembalianBarangMilikNegaraController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keterangan Pengembalian Barang Milik Negara (Kasatker)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratKeteranganPengembalianBarangMilikNegaraPath,
                decoration: InputDecoration(
                  hintText: 'Upload Pass Foto Suami/Istri',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratKeteranganPengembalianBarangMilikNegara(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratKeteranganPengembalianBarangMilikNegaraController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Keterangan Pengembalian Barang Milik Negara (Kasatker)',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratKeteranganPengembalianBarangMilikNegaraPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Keterangan Pengembalian Barang Milik Negara (kasatker)',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratKeteranganPengembalianBarangMilikNegara(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratPernyataanTidakDiJatuhiHukumanDisiplinController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Pernyataan Tidak Di Jatuhi Hukuman Disiplin',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratPernyataanTidakDiJatuhiHukumanDisiplinPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Pernyataan Tidak Di Jatuhi Hukuman Disiplin',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratPernyataanTidakDiJatuhiHukumanDisiplin(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: suratPernyataanTidakSedangProsesPidanaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Surat Pernyataan Tidak Sedang Proses Pidana',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameSuratPernyataanTidakSedangProsesPidanaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Surat Pernyataan Tidak Sedang Proses Pidana',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileSuratPernyataanTidakSedangProsesPidana(),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextField(
                controller: tandaJasaController,
                decoration: InputDecoration(
                  hintText: 'Nomor Tanda Jasa',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              TextField(
                controller: NameTandaJasaPath,
                decoration: InputDecoration(
                  hintText: 'Upload Tanda Jasa',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadFileTandaJasa(),
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