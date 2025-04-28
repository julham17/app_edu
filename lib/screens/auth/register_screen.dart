import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../dashboard/student_dashboard.dart';
import '../dashboard/teacher_dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _role = 'siswa'; // default role
  final _kelasController = TextEditingController(); // hanya jika siswa
  bool isLoading = false;

  Future<void> register() async {
    setState(() => isLoading = true);
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final userDoc = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'role': _role,
        'kelas': _role == 'siswa' ? _kelasController.text.trim() : null,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(userDoc);

      if (_role == 'guru') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TeacherDashboard()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const StudentDashboard()));
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(content: Text('Gagal daftar: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nama')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _role,
              items: const [
                DropdownMenuItem(value: 'siswa', child: Text("Siswa")),
                DropdownMenuItem(value: 'guru', child: Text("Guru")),
              ],
              onChanged: (val) => setState(() => _role = val!),
              decoration: const InputDecoration(labelText: "Pilih Role"),
            ),
            if (_role == 'siswa') ...[
              const SizedBox(height: 10),
              TextField(controller: _kelasController, decoration: const InputDecoration(labelText: 'Kelas')),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : register,
              child: isLoading ? const CircularProgressIndicator() : const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
