import 'package:flutter/foundation.dart';

class UserState {
  static final UserState _instance = UserState._internal();

  factory UserState() {
    return _instance;
  }

  UserState._internal();

  ValueNotifier<String> nama = ValueNotifier<String>('Nama Anda');
  ValueNotifier<String> alamat = ValueNotifier<String>('Alamat Anda');

  void updateName(String newNama) {
    nama.value = newNama;
  }

  void updateAlamat(String newAlamat) {
    alamat.value = newAlamat;
  }
}
