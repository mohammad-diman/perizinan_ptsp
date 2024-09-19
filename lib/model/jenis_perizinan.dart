import 'dart:convert';

List<JenisPerizinan> jenisPerizinanFromJson(String str) => List<JenisPerizinan>.from(json.decode(str).map((x) => JenisPerizinan.fromJson(x)));

String jenisPerizinanToJson(List<JenisPerizinan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JenisPerizinan {
  int id;
  String nama;
  Durasi durasi;
  MasaBerlaku masaBerlaku;
  CreatedAt createdAt;

  JenisPerizinan({
    required this.id,
    required this.nama,
    required this.durasi,
    required this.masaBerlaku,
    required this.createdAt,
  });

  factory JenisPerizinan.fromJson(Map<String, dynamic> json) => JenisPerizinan(
    id: json["id"],
    nama: json["nama"],
    durasi: durasiValues.map[json["durasi"]]!,
    masaBerlaku: masaBerlakuValues.map[json["masa_berlaku"]]!,
    createdAt: createdAtValues.map[json["created_at"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "durasi": durasiValues.reverse[durasi],
    "masa_berlaku": masaBerlakuValues.reverse[masaBerlaku],
    "created_at": createdAtValues.reverse[createdAt],
  };
}

enum CreatedAt {
  THE_12_SEPTEMBER_2024
}

final createdAtValues = EnumValues({
  "12 September 2024": CreatedAt.THE_12_SEPTEMBER_2024
});

enum Durasi {
  THE_1_HARI
}

final durasiValues = EnumValues({
  "1 hari": Durasi.THE_1_HARI
});

enum MasaBerlaku {
  SELAMANYA
}

final masaBerlakuValues = EnumValues({
  "selamanya": MasaBerlaku.SELAMANYA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
