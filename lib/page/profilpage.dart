import 'package:b/model/user.dart';
import 'package:b/page/set_profil.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
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
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/145748496?v=4'),
                backgroundColor: Colors.grey[200],
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
                    return Text('Alamat: '+ alamat,
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
        tooltip: 'Rotate',
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
