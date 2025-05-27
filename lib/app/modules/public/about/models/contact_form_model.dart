class ContactFormModel {
  String name;
  String phone;
  String email;
  String message;

  ContactFormModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.message,
  });

  Map<String, String> toMap() {
    return {'name': name, 'phone': phone, 'email': email, 'message': message};
  }
}
