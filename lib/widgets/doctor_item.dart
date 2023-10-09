import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String id_pengajuan;
  final String nama_pengajuan;
  final String jabatan_pengajuan;
  final String jenis_pengajuan;
  final String status_pengajuan;
  final String tanggal_pengajuan;
  const DoctorItem({
    Key? key,
    required this.id_pengajuan,
    required this.nama_pengajuan,
    required this.jabatan_pengajuan,
    required this.status_pengajuan,
    required this.jenis_pengajuan,
    required this.tanggal_pengajuan
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: new GestureDetector(
          onTap: null,
          child: Container(
            width: 160,
            decoration: BoxDecoration(
                color: const Color.fromARGB(95, 179, 173, 173),
                borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Id Pengajuan : $id_pengajuan",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Nama Pengajuan : $nama_pengajuan",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Jabatan : $jabatan_pengajuan",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Jenis Pengajuan :  $jenis_pengajuan",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Status Pengajuan :  $status_pengajuan",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
      ),
    );
  }
}