import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Siswa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Selamat datang, Siswa!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('Di sini kamu bisa melihat tugas dan riwayat kehadiran.'),
          ],
        ),
      ),
    );
  }
}
