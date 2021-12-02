import 'package:flutter/material.dart';
import 'package:flutter_aplikasi_absensi/mahasiswa/ui/absen/absen_page.dart';
import 'package:flutter_aplikasi_absensi/mahasiswa/ui/home/home_page.dart';
import 'package:flutter_aplikasi_absensi/mahasiswa/ui/login/login_page.dart';
import 'package:flutter_aplikasi_absensi/shared/constants.dart';
import 'package:flutter_aplikasi_absensi/shared/ui/entrance/entrance_page.dart';
import 'package:flutter_aplikasi_absensi/shared/ui/get_started/get_started_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Presensi',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: LoginPage(),
    );
  }
}
