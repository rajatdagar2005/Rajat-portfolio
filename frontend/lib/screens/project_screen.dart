// lib/screens/project_screen.dart
import 'package:flutter/material.dart';
import '../models/project.dart';
import '../services/project_service.dart';
import '../widgets/project_card.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = ProjectService().fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Projects',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2196F3),
            letterSpacing: 1.5,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 40),
        FutureBuilder<List<Project>>(
          future: _projectsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFF2196F3)));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No projects found.', style: TextStyle(color: Colors.white)));
            }

            final filteredProjects = snapshot.data!
                .where((project) =>
            project.title != "MyShoppingListApp" &&
                project.title != "UnitConverter")
                .toList();

            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: filteredProjects
                  .map((project) => ProjectCard(project: project))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
