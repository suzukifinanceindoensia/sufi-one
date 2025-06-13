class RegisterModel {
  String fullName;
  String email;
  String telpNumber;
  String password;

  RegisterModel({
    required this.fullName,
    required this.email,
    required this.telpNumber,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      fullName: json['fullName'],
      email: json['email'],
      telpNumber: json['telpNumber'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'telpNumber': telpNumber,
      'password': password,
    };
  }
}
