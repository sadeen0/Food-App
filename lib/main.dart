import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Features/Bottom_Navbar.dart';
import 'package:device_preview_plus/device_preview_plus.dart';

void main() {
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MainApp(), // Wrap your app
  ),
);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtomNavbar()
    );
  }
}
