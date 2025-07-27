import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  final List<Map<String, String>> skills = const [
    {'name': 'Kotlin', 'icon': 'assets/icons/kotlin.png'},
    {'name': 'Ktor', 'icon': 'assets/icons/ktor.png'},
    {'name': 'MongoDB', 'icon': 'assets/icons/mongodb.png'},
    {'name': 'PostgreSQL', 'icon': 'assets/icons/postgresql.png'},
    {'name': 'HTML', 'icon': 'assets/icons/html.png'},
    {'name': 'CSS', 'icon': 'assets/icons/css.png'},
    {'name': 'Git', 'icon': 'assets/icons/git.png'},
    {'name': 'GitHub', 'icon': 'assets/icons/github.png'},
    {'name': 'Flutter', 'icon': 'assets/icons/flutter.png'},
    {'name': 'JetpackCompose', 'icon': 'assets/icons/jetpackcompose.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
              letterSpacing: 1.5,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Technologies I use :',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 22,
              color: Colors.grey[400],
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: skills
                .map(
                  (skill) => SkillCard(
                name: skill['name']!,
                iconPath: skill['icon']!,
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String name;
  final String iconPath;

  const SkillCard({
    super.key,
    required this.name,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.03),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
              height: 80,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 1,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
