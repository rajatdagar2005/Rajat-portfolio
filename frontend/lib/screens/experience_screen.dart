import 'package:flutter/material.dart';
import '../models/Experience.dart';
import '../services/experience_service.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
              fontFamily: 'Lato',
              letterSpacing: 1.2,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 40),
          FutureBuilder<List<Experience>>(
            future: ExperienceService.fetchExperience(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Color(0xFF2196F3)));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No experience found.', style: TextStyle(color: Colors.white));
              }

              final experiences = snapshot.data!;
              return Column(
                children: experiences.map((exp) => _buildExperienceCard(exp)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(Experience exp) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF2196F3), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exp.role.trim(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            exp.company.trim(),
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF2196F3),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${exp.startDate.trim()} - ${exp.endDate.trim()}',
            style: const TextStyle(color: Colors.white70, fontFamily: 'Lato'),
          ),
          const SizedBox(height: 12),
          Text(
            exp.description.trim(),
            style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Lato'),
          ),
        ],
      ),
    );
  }
}
