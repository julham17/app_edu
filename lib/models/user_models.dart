class AppUser {
  final String uid;      // ID unik user (dari Firebase)
  final String name;     // Nama user
  final String email;    // Email
  final String role;     // Role: 'siswa' atau 'guru'
  final String? kelas;   // Kelas (optional, hanya untuk siswa)

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    this.kelas,
  });

  factory AppUser.fromMap(Map<String, dynamic> data, String uid) {
    return AppUser(
      uid: uid,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? '',
      kelas: data['kelas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'kelas': kelas,
    };
  }
}
