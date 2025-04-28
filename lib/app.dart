import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // halaman loading

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eduSmart', // judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(), // halaman pertama yang dibuka
      debugShowCheckedModeBanner: false, // menghilangkan banner debug di pojok kanan
    );
  }
}
