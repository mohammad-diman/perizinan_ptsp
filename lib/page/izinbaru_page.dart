import 'package:animate_do/animate_do.dart';
import 'package:b/form/jenis_surat.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IzinbaruPage extends StatelessWidget {
  const IzinbaruPage({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Buat Izin Baru', style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: const Center(
              child: SizedBox(
                height: 750,
                child: JenisSurat(),
              ),
            ),
          ),
        ],
      )
    );
  }
}
