import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SumberIdentitas extends StatefulWidget {
  const SumberIdentitas({super.key});

  @override
  State<SumberIdentitas> createState() => _SumberIdentitasState();
}

class _SumberIdentitasState extends State<SumberIdentitas> {
  int _selectRadio = 1;

  void _handleRadioaValueChange(int? value) {
    setState(() {
      _selectRadio = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: const Text('Opsi 1'),
            leading: Radio(
            value: 1, 
            groupValue: _selectRadio, 
            onChanged: _handleRadioaValueChange),
          ),
          ListTile(
            title: const Text('Opsi 2'),
            leading: Radio(
            value: 2, 
            groupValue: _selectRadio, 
            onChanged: _handleRadioaValueChange),
          ),
          ListTile(
            title: const Text('Opsi 3'),
            leading: Radio(
            value: 3, 
            groupValue: _selectRadio, 
            onChanged: _handleRadioaValueChange),
          ),
        ],
      ),
    );
  }
}
