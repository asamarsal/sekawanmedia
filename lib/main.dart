import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sekawanmedia/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Izin Internet
  var status = await Permission.storage;

  // Jika izin belum diberikan, maka minta izin
  if (status != PermissionStatus.granted) {
    await Permission.storage.request();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
