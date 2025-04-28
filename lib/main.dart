import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // pastikan binding flutter berjalan sebelum init async
  await Firebase.initializeApp(); // inisialisasi firebase
  runApp(const MyApp()); // jalankan aplikasi utama
}
