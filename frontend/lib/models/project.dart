class Project {
  final String title;
  final String description;
  final List<String> imageUrls;
  final String projectUrl;
  final List<String> tags;

  Project({
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.projectUrl,
    required this.tags,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrls: List<String>.from(json['imageUrl'] as List<dynamic>),
      projectUrl: json['projectUrl'] as String,
      tags: List<String>.from(json['tags'] as List<dynamic>),
    );
  }
}
