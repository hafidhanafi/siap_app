import 'dart:convert';
import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  String id_user = "";

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
    fetchDataPangkat();
    fetchDataGolongan();

  }

  String selectedItemPangkat = "";
  String selectedItemGolongan = "";
  String pathUpload = "";


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
  List<dynamic> dataPangkat = [];
  List<dynamic> dataGolongan = [];



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
  Future<void> fetchDataPangkat() async {
    final prefs = await SharedPreferences.getInstance();
    final String endpoint = 'https://haver.my.id/api-services/public/api/v1/admin/getPangkat';
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
          "status_user": result['status_user']
        }),
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
        if(responseData['responseCode'] == "00"){
          setState(() {
            if(responseData['responseData'] != Null){
              dataPangkat = responseData['responseData'];
            }
          });
          // responseData['responseData'].toString();
          // _showMessageAlert(context, "Notifikasi !!!", responseData['responseData'].toString());
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

  Future<void> fetchDataGolongan() async {
    final prefs = await SharedPreferences.getInstance();
    final String endpoint = 'https://haver.my.id/api-services/public/api/v1/admin/getGolongan';
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
          "status_user": result['status_user']
        }),
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
        if(responseData['responseCode'] == "00"){
          setState(() {
            if(responseData['responseData'] != Null){
              dataGolongan = responseData['responseData'];
            }
          });
          // responseData['responseData'].toString();
          // _showMessageAlert(context, "Notifikasi !!!", responseData['responseData'].toString());
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

  Future<void> fetchDataFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    final String endpoint = 'https://haver.my.id/api-services/public/api/v1/admin/getProfile';

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
            if(responseData['responseData'] != null){
              namaLengkap.text = responseData['responseData']['nama_lengkap'];
              tanggalLahirController.text = responseData['responseData']['tanggal_lahir'];
              nip.text = result['nip'];
              jabatan.text = responseData['responseData']['jabatan'];
              tahunMasuk.text = responseData['responseData']['tahun_masuk'];
              tmtPangkatController.text = responseData['responseData']['tmt_pangkat'];
              kgbController.text = responseData['responseData']['kgb'];
              selectedItemPangkat = responseData['responseData']['id_pangkat'];
              selectedItemGolongan = responseData['responseData']['id_golongan'];
              id_user = responseData['responseData']['id_user'];
            }
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

  Future<void> updateProfile(context) async{
    final url = Uri.parse('https://haver.my.id/api-services/public/api/v1/admin/setProfile'); // Replace with your server URL
    File file = File(pathUpload);

    final prefs = await SharedPreferences.getInstance();
    final resPref = prefs.getString("user");
    final token = prefs.getString("token");

    final Map<String, dynamic> user = jsonDecode(resPref!);
    // Create a multipart request
    final request = http.MultipartRequest('POST', url);

    request.headers['Authorization'] = 'Bearer $token';
    // Add the file to the request
    if(pathUpload != ""){
      request.files.add(
        http.MultipartFile(
          'file_photo',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last, // Use the file name from the path
          contentType: MediaType('application', 'octet-stream'),
        ),
      );
    }


    // Add JSON data to the request
    request.fields.addAll({
      "id_user": user['id_user'],
      "nama_lengkap": namaLengkap.text,
      "tanggal_lahir": tanggalLahirController.text,
      "id_status":"",
      "nip_nrp":nip.text,
      "id_pangkat": selectedItemPangkat,
      "jabatan" : jabatan.text,
      "tmt_pangkat" : tmtPangkatController.text,
      "kgb" : kgbController.text,
      "tahun_masuk" : tahunMasuk.text,
      "id_golongan" : selectedItemGolongan,
      "status_user" : user['status_user']
    });

    // Send the request and wait for the response
    final response = await http.Response.fromStream(await request.send());
    // _showMessageAlert(context, "Notifikasi !!!", response.body.toString());
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // Successful upload
      // print('File uploaded successfully.');
      // print('Response: ${response.body}');
      // final responseData = jsonDecode(response.body);
      _showMessageAlert(context, "Notifikasi !!!", responseData['responseMessage']);
    } else {
      // Handle the error
      // print('Error uploading file and JSON: ${response.statusCode}');
      _showMessageAlert(context, "Notifikasi !!!", "${response.statusCode}");
    }
  }
  Future<void> _uploadProfile() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
      FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      setState(() {
        pathController.text = result.files.single.name!;
        pathUpload = result.files.single.path!;
      });

      // final jsonData = {'key1': 'value1', 'key2': 'value2'}; // Replace with your JSON data
      // await uploadFileAndJson(file, jsonData);
    }
  }

  Future<void> _selectDateLahir(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tanggalLahirController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }
  Future<void> _selectDateTmt(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tmtPangkatController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectDateKgb(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        kgbController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Registration Page'),
      // ),
      body: Padding(
        // padding: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
        // child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network("https://haver.my.id/api-services/public/getPhoto/${(id_user!="")?id_user:"999999"}", height: 100, width: 100,),
              SizedBox(height: 20),
              Text(
                'Update Profile',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: namaLengkap,
                decoration: InputDecoration(
                  hintText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: tanggalLahirController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                  labelText: 'Tanggal Lahir',
                ),
                onTap: () => _selectDateLahir(context),
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextField(
                controller: nip,
                decoration: InputDecoration(
                  hintText: 'NIP/NRP',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),

              SizedBox(height: 10),
              DropdownButtonFormField(
                value: (selectedItemPangkat != "")?selectedItemPangkat:null,
                decoration: InputDecoration(
                  hintText: 'Pangkat',
                  prefixIcon: Icon(Icons.select_all),
                ),
                onChanged: (newValue) {
                  //     setS() {
                  //   selectedItem = newValue!;
                  // };
                  setState(() {
                    selectedItemPangkat = newValue!;
                  });
                },
                items: dataPangkat.map((item) {
                  return DropdownMenuItem<String>(
                    value: item['id_pangkat'],
                    child: Text(item['nama_pangkat']),
                  );
                }).toList(),

              ),
              SizedBox(height: 10),
              TextField(
                controller: jabatan,
                decoration: InputDecoration(
                  hintText: 'Jabatan',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: tmtPangkatController,
                decoration: InputDecoration(
                  hintText: 'Tmt Pangkat',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                onTap: () => _selectDateTmt(context),
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextField(
                controller: kgbController,
                decoration: InputDecoration(
                  hintText: 'Kgb',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                onTap: () => _selectDateKgb(context),
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextField(
                controller: tahunMasuk,
                decoration: InputDecoration(
                  hintText: 'Tahun Masuk',
                  prefixIcon: Icon(Icons.input_sharp),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: (selectedItemGolongan != "")?selectedItemGolongan:null,
                decoration: InputDecoration(
                  hintText: 'Golongan',
                  prefixIcon: Icon(Icons.select_all),
                ),
                onChanged: (newValue) {
                  //     setS() {
                  //   selectedItem = newValue!;
                  // };
                  setState(() {
                    selectedItemGolongan = newValue!;
                  });
                },
                items: dataGolongan.map((item) {
                  return DropdownMenuItem<String>(
                    value: item['id_golongan'],
                    child: Text(item['nama_golongan']),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: pathController,
                decoration: InputDecoration(
                  hintText: 'Upload',
                  prefixIcon: Icon(Icons.upload_file),
                ),
                onTap: () => _uploadProfile(),
                readOnly: true,
              ),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Implement your registration logic here
                        updateProfile(context);
                      },
                      child: Text('Update Profile'),
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