import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:portfolio/screens/titlebar.dart';
import 'package:portfolio/screens/skills.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: TitleBar(
          onHomeTap: () => _scrollTo(_homeKey),
          onSkillsTap: () => _scrollTo(_skillsKey),
          onProjectTap: () => _scrollTo(_projectKey),
          onExperienceTap: () => _scrollTo(_experienceKey),
          onContactTap: () => _scrollTo(_contactKey),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(
                children: [
                  // HERO SECTION with _homeKey
                  Container(
                    key: _homeKey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Column
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hi I am',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'RAJAT DAGAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Application Developer',
                                style: TextStyle(
                                  color: Color(0xFF2196F3),
                                  fontSize: 44,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Social icons
                              Row(
                                children: [
                                  _buildIconButton(
                                    FontAwesomeIcons.linkedin,
                                    "https://www.linkedin.com/in/rajat-dagar-822a76291",
                                  ),
                                  const SizedBox(width: 16),
                                  _buildIconButton(
                                    FontAwesomeIcons.github,
                                    "https://github.com/rajatdagar2005",
                                  ),
                                ],
                              ),

                              const SizedBox(height: 32),

                              // Buttons
                              // Buttons
                              Row(
                                children: [
                                  // Hire Me Button
                                  GestureDetector(
                                    onTap: () => _scrollTo(_contactKey),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Color(0xFF2196F3), Color(0xFF2196F3)],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'Hire Me',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 24),

                                  // Download Resume Button
                                  GestureDetector(
                                    onTap: () async {
                                      const url = 'https://raw.githubusercontent.com/rajatdagar2005/Rajat-portfolio/main/frontend/assets/resume.pdf'; // OR host it publicly (e.g., GitHub Pages or Firebase)
                                      final uri = Uri.parse(url);
                                      if (!await launchUrl(uri, webOnlyWindowName: "_blank")) {
                                        throw 'Could not launch resume';
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xFF959595),
                                          width: 2,
                                        ),
                                      ),
                                      child: const Text(
                                        'Download Resume',
                                        style: TextStyle(
                                          color: Color(0xFF959595),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 40),

                              // Stats
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.04),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildStat('1+', 'Experiences'),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey[600]?.withOpacity(0.7),
                                      margin: const EdgeInsets.symmetric(horizontal: 20),
                                    ),
                                    _buildStat('7+', 'Project done'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right Image
                        Expanded(
                          flex: 5,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Back circle
                              Container(
                                width: 480,
                                height: 480,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.04),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Profile image
                              Container(
                                width: 360,
                                height: 360,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.blue.shade500,
                                    width: 1.2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/image/RAJATPic.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),

                  // Skills Section
                  Container(
                    key: _skillsKey,
                    child: const Skills(),
                  ),

                  const SizedBox(height: 100),

                  // Project Section
                  Container(
                    key: _projectKey,
                    child: const ProjectScreen(),
                  ),

                  const SizedBox(height: 100),

                  // Experience Section
                  Container(
                    key: _experienceKey,
                    child: const ExperienceScreen(),
                  ),

                  const SizedBox(height: 100),

                  // Contact Section
                  Container(
                    key: _contactKey,
                    child: ContactScreen(),
                  ),

                  const SizedBox(height: 100),

                  // TODO: Add other sections here later:
                  // ProjectSection(key: _projectKey)
                  // ExperienceSection(key: _experienceKey)
                  // ContactSection(key: _contactKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String url) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF575757),
            width: 0.7,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String count, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Color(0xFF2196F3),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
