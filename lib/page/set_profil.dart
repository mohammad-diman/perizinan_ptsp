import 'dart:io';

import 'package:b/model/user.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:b/model/user.dart';

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

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final PickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      setState(() {
        _imageFile = File(PickedFile.path);
      });
    }
  }

  Future<void> _takePicture() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

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

  Widget _buildAvatar(String name) {
    if (_imageFile != null) {
      return CircleAvatar(
        radius: 60,
        backgroundImage: FileImage(_imageFile!),
        backgroundColor: Colors.grey[200],
      );
    } else {
      String firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '?';
      return CircleAvatar(
        radius: 60,
        backgroundColor: _getAvatarColor(name), // Warna background dinamis
        child: Text(
          firstLetter,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      );
    }
  }

  Color _getAvatarColor(String nama) {
    final int hash = nama.hashCode;
    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal
    ];
    return colors[hash % colors.length];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Pengaturan Profil',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Implementasi untuk mengubah foto profil
                showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Pilih dari galeri'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    _pickImage();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Iconsax.camera),
                                  title: Text('Ambil Gambar Baru'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    _takePicture(); 
                                  },
                                )
                              ],
                            )));
              },
              child: ValueListenableBuilder(
                    valueListenable: UserState().nama,
                    builder: (context, nama, child) {
                      return _buildAvatar(nama);
                    }),
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
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
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
