import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecialistItem extends StatelessWidget {
  final String imagePath;
  final String imageName;
  final String status_user;
  final String status_fitur;
  const SpecialistItem({
    Key? key,
    required this.imagePath,
    required this.imageName,
    required this.status_user,
    required this.status_fitur,
  }) : super(key: key);

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

  Future<void> routesMenu(context) async {
    final prefs = await SharedPreferences.getInstance();
    final resPref = await prefs.getString("user");
    if(resPref == null){
      _showMessageAlert(context, "Notifikasi", "Silahkan Lengkapi Data Profile Terlebih Dahulu");
    }else{
      if(status_fitur == "1"){
        if(status_user == "1"){
          Navigator.pushNamed(context, '/formNaikPangkatPns');
        }else{
          Navigator.pushNamed(context, '/formNaikPangkatPolri');
        }
      }else if(status_fitur == "2"){
        if(status_user == "1"){
          Navigator.pushNamed(context, '/formKgbPns');
        }else{
          Navigator.pushNamed(context, '/formKgbPolri');
        }
      }else if(status_fitur == "3"){
        if(status_user == "1"){
          Navigator.pushNamed(context, '/formKhirdinPns');
        }else{
          Navigator.pushNamed(context, '/formKhirdinPolri');
        }
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: const EdgeInsets.all(12.0),
    //   decoration: BoxDecoration(
    //     color: const Color.fromARGB(95, 179, 173, 173),
    //     borderRadius: BorderRadius.circular(15.0),
    //   ),
    //
    //   child: Row(
    //     children: [
    //       Image.asset(
    //         imagePath,
    //         width: 32,
    //       ),
    //       // Icon(Icons.upgrade),
    //       const SizedBox(
    //         width: 8,
    //       ),
    //       Text(
    //         imageName,
    //         style: const TextStyle(fontSize: 14),
    //
    //       ),
    //     ],
    //   ),
    // );
    return new GestureDetector(
        onTap: (){
          // print("Container clicked");
          routesMenu(context);
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(95, 179, 173, 173),
              borderRadius: BorderRadius.circular(15.0),
            ),

            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 32,
                ),
                // Icon(Icons.upgrade),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  imageName,
                  style: const TextStyle(fontSize: 14),

                ),
              ],
            ),
        ),
    );
  }
}