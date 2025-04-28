import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // cek user apakah ada
import 'auth/login_screen.dart';
import 'dashboard/student_dashboard.dart';
import 'dashboard/teacher_dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus(); // jalankan fungsi saat splash screen dibuka
  }

  void checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // delay 2 detik
    final user =
        FirebaseAuth.instance.currentUser; //  cek apakah user sudah login
    if (user != null) {
      // jika sudah login , arakan dashboard sesuai role
      final role = 'siswa';
      if (role == 'guru') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TeacherDashboard()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const StudentDashboard()));
      }
    } else {
      // Jika belum login, arahkan ke login screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()), // Tampilan loading lingkaran
    );
  }
}
