import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            'My technical proficiency across various domains',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 60),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              _SkillCard(
                title: 'Languages',
                icon: Icons.code,
                skills: ['Dart', 'JavaScript', 'TypeScript', 'Python'],
                delay: 200,
              ),
              _SkillCard(
                title: 'Frameworks',
                icon: Icons.layers,
                skills: ['Flutter', 'Angular', 'Ionic', 'Node.js', 'Express.js'],
                delay: 400,
              ),
              _SkillCard(
                title: 'State Management',
                icon: Icons.hub,
                skills: ['Riverpod', 'BLoC', 'Provider'],
                delay: 600,
              ),
              _SkillCard(
                title: 'Mobile & Integrations',
                icon: Icons.smartphone,
                skills: [
                  'Firebase',
                  'FCM',
                  'Razorpay',
                  'Google Maps',
                  'Geolocation',
                  'Bluetooth',
                ],
                delay: 800,
              ),
              _SkillCard(
                title: 'Backend & Tools',
                icon: Icons.storage,
                skills: ['REST APIs', 'MySQL', 'Sequelize', 'Git & GitHub', 'Postman'],
                delay: 1000,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> skills;
  final int delay;

  const _SkillCard({
    required this.title,
    required this.icon,
    required this.skills,
    required this.delay,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        padding: const EdgeInsets.all(32),
        transform: Matrix4.translationValues(0, _isHovered ? -10.0 : 0.0, 0),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered 
                ? theme.primaryColor.withValues(alpha : 0.5) 
                : theme.dividerColor.withValues(alpha : 0.1),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withValues(alpha : _isHovered ? 0.15 : 0.05),
              blurRadius: _isHovered ? 30 : 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.primaryColor.withValues(alpha : 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: theme.primaryColor, size: 32),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: widget.skills.map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDark 
                        ? Colors.white.withValues(alpha : 0.05)
                        : Colors.black.withValues(alpha : 0.05),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: theme.dividerColor.withValues(alpha : 0.1),
                    ),
                  ),
                  child: Text(
                    skill,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: widget.delay.ms, duration: 600.ms).slideY(begin: 0.2, end: 0);
  }
}
