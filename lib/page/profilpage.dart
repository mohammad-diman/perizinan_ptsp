import 'dart:io';
import 'package:path/path.dart';

import 'package:b/model/user.dart';
import 'package:b/page/set_profil.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>
    with SingleTickerProviderStateMixin {
  String _nama = 'Nama Anda';
  String _alamat = 'Alamat Anda';

  late AnimationController _controller;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      File tempImage = File(pickedFile.path);
      String savedImage = await _saveImage(tempImage);
      setState(() {
        _imageFile = File(savedImage);
      });
    }
  }

  Future<String> _saveImage(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    final String fileName = basename(image.path);

    final File localImage = await image.copy('$path/$fileName');
    return localImage.path;
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
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profil',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Pilih dari Galeri'),
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
                    ),
                  );
                },
                child: ValueListenableBuilder(
                    valueListenable: UserState().nama,
                    builder: (context, nama, child) {
                      return _buildAvatar(nama);
                    }),
              ),
              SizedBox(height: 20),
              ValueListenableBuilder<String>(
                  valueListenable: UserState().nama,
                  builder: (context, nama, child) {
                    return Text(nama,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold));
                  }),
              SizedBox(height: 10),
              ValueListenableBuilder<String>(
                  valueListenable: UserState().alamat,
                  builder: (context, alamat, child) {
                    return Text('Alamat: ' + alamat,
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade700));
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfilePage(
                nama: _nama,
                alamat: _alamat,
                
              ),
            ),
          );
          if (result != null) {
            UserState().updateName(result['nama']);
            UserState().updateAlamat(result['alamat']);
            
          }
        },
        tooltip: 'Pengaturan Profil',
        backgroundColor: Color.fromRGBO(3, 165, 252, 1),
        child: AnimatedBuilder(
          animation: _controller,
          child: Icon(Iconsax.setting),
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 6.3,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
