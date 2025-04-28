import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;
  final String role;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(name),
            const SizedBox(height: 16),
            const Text('Email:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(email),
            const SizedBox(height: 16),
            const Text('Role:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(role),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: implementasi logout (FirebaseAuth.signOut)
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
