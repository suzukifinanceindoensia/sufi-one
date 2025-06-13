class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String token;
  final String address;
  final String role;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.token,
    required this.address,
    required this.role,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    password: json['password'] ?? '',
    token: json['token'] ?? '',
    address: json['address'] ?? '',
    role: json['role'] ?? '',
    phone: json['phone'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'token': token,
    'address': address,
    'role': role,
    'phone': phone,
  };

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? token,
    String? address,
    String? role,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      address: address ?? this.address,
      role: role ?? this.role,
      phone: phone ?? this.phone,
    );
  }
}
