class UserDto {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? foto;
  final String? default_foto;
  final String? created_at;
  final String? updated_at;

  UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.foto,
    required this.default_foto,
    required this.created_at,
    required this.updated_at,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      foto: json["foto"],
      default_foto: json["default_foto"],
      created_at: json["created_at"],
      updated_at: json["updated_at"]
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "foto": foto,
    "default_foto": default_foto,
    "created_at": created_at,
    "updated_at": updated_at,
  };
}