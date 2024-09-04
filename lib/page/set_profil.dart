import 'package:b/model/user.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String nama;
  final String alamat;

  EditProfilePage({required this.nama, required this.alamat});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _namaController = TextEditingController();
  late TextEditingController _alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: UserState().nama.value);
    _alamatController = TextEditingController(text: widget.alamat);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Implementasi penyimpanan profil
    Navigator.pop(context, {
      'nama': _namaController.text,
      'alamat': _alamatController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Implementasi untuk mengubah foto profil
                print('Ganti Foto Profil');
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/120'),
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: _saveProfile,
              child: Text('Simpan', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
