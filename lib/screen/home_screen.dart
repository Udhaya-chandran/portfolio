import 'package:flutter/material.dart';
import 'package:portfolio/screen/sections/contact_section.dart';
import 'package:portfolio/screen/sections/experience_section.dart';
import 'package:portfolio/screen/sections/hero_section.dart';
import 'package:portfolio/screen/sections/projects_section.dart';
import 'package:portfolio/screen/sections/skills_section.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            SkillsSection(),
            ExperienceSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
