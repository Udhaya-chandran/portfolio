import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Skills & Technologies',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 40),

          /// SKILL GROUPS
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              SkillCard(
                title: 'Languages',
                skills: [
                  'Dart',
                  'JavaScript',
                  'TypeScript',
                  'Python',
                ],
              ),
              SkillCard(
                title: 'Frameworks',
                skills: [
                  'Flutter',
                  'Angular',
                  'Ionic',
                  'Node.js',
                  'Express.js',
                ],
              ),
              SkillCard(
                title: 'State Management',
                skills: [
                  'Riverpod',
                  'BLoC',
                  'Provider',
                ],
              ),
              SkillCard(
                title: 'Mobile & Integrations',
                skills: [
                  'Firebase',
                  'FCM',
                  'Razorpay',
                  'Google Maps',
                  'Geolocation',
                  'Bluetooth',
                ],
              ),
              SkillCard(
                title: 'Backend & Tools',
                skills: [
                  'REST APIs',
                  'MySQL',
                  'Sequelize',
                  'Git & GitHub',
                  'Postman',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String title;
  final List<String> skills;

  const SkillCard({
    super.key,
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(skill),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
