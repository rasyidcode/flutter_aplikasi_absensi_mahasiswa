import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aplikasi_absensi/shared/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AbsenPage extends StatefulWidget {
  const AbsenPage({Key? key}) : super(key: key);

  @override
  _AbsenPageState createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> {
  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/logo_kampus.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final message = 'INTAN FADILAH ALRASYID';

    final qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        final size = 280.0;
        if (!snapshot.hasData) {
          return Container(width: size, height: size);
        }
        return CustomPaint(
          size: Size.square(size),
          painter: QrPainter(
            data: message,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: kPrimaryColor,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: kPrimaryColor,
            ),
            // size: 320.0,
            embeddedImage: snapshot.data,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size.square(60),
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Absen Page',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Column(
          children: [
            Text(
              'Pengenalan Pemrograman',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Pertemuan Ke-1',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              ),
            ),
            Text(
              'Marfuad Fajri, S.Pdi',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Jam 10:00 - 12:00',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 32.0),
            Material(
              color: Colors.white,
              child: Center(
                child: Container(
                  width: 280,
                  child: qrFutureBuilder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
