class ContactModel {
  final String name;
  final String email;
  final String message;

  ContactModel({
    required this.name,
    required this.email,
    required this.message,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'],
      email: json['email'],
      message: json['message'],
    );
  }
}
