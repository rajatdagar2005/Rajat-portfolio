import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(16),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              project.title,
              style: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2196F3),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              project.description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),

            // Tags
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: project.tags
                  .map(
                    (tag) => Chip(
                  label: Text(tag),
                  backgroundColor: Colors.black,
                  labelStyle: const TextStyle(color: Color(0xFF2196F3)),
                  shape: StadiumBorder(
                      side: BorderSide(color: Color(0xFF2196F3))),
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Images
            if (project.imageUrls.isNotEmpty)
              SizedBox(
                height: 400,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: project.imageUrls.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        project.imageUrls[index],
                        width: 200,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 200,
                            color: Colors.black12,
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: Color(0xFF2196F3)),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 24),

            // Button
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () async {
                  final url = Uri.parse(project.projectUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "View Project",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
