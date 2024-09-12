import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JenisSurat extends StatefulWidget {
  const JenisSurat({super.key});

  @override
  State<JenisSurat> createState() => _JenisSuratState();
}




class _JenisSuratState extends State<JenisSurat> {

  List <String> surat = ['Penelitian A', 'Penelitian B', 'Penelitian C', 'Penelitian D', 'Penelitian E'];


  String? selectedSurat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Buat Izin Baru', style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),),
            backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DropdownButton(
            hint: const Text('Pilih Jenis Surat', style: TextStyle(fontSize: 14),),
            borderRadius: BorderRadius.circular(18),
            dropdownColor: Colors.white,
            value: selectedSurat,
            onChanged: (String? newValue) {
              setState(() {
                selectedSurat = newValue;
              });
            },
            items: surat.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
              );
            }).toList(),
        ),
      ),
    );
  }
}
