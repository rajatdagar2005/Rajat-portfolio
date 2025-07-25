import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const TitleBar({
    super.key,
    required this.onHomeTap,
    required this.onSkillsTap,
    required this.onProjectTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navItem('Home', onTap: onHomeTap),
          const SizedBox(width: 32),
          _navItem('Skills', onTap: onSkillsTap),
          const SizedBox(width: 32),
          _navItem('Project', onTap: onProjectTap),
          const SizedBox(width: 32),
          _navItem('Experience', onTap: onExperienceTap),
          const SizedBox(width: 32),
          _navItem('Contact me', onTap: onContactTap),
        ],
      ),
    );
  }

  Widget _navItem(String label, {bool isActive = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF2196F3) : const Color(0xFF959595),
            fontSize: 18,
            fontFamily: 'Lato',
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }
} 