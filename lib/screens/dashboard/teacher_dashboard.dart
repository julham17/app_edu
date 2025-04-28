import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Guru'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Selamat datang, Guru!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('Di sini kamu bisa mengelola tugas dan melihat kehadiran siswa.'),
          ],
        ),
      ),
    );
  }
}
