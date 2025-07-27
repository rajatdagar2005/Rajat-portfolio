class Experience {
  final String role;
  final String company;
  final String startDate;
  final String endDate;
  final String description;

  Experience({
    required this.role,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      role: json['role'],
      company: json['company'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
    );
  }
}
