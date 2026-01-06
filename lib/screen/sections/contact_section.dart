import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Column(
              children: [
                Text(
                  'Get In Touch',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 16),
                Text(
                  'Feel free to reach out for opportunities, collaborations, or discussions.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 60),

                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _ContactCard(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      value: 'udhayachandranbalamurugan@gmail.com',
                      onTap: () => _launchUrl(
                        'mailto:udhayachandranbalamurugan@gmail.com',
                      ),
                      delay: 400,
                    ),
                    _ContactCard(
                      icon: Icons.phone_outlined,
                      title: 'Phone',
                      value: '+91 9976156907',
                      onTap: () => _launchUrl('tel:+919976156907'),
                      delay: 600,
                    ),
                    const _ContactCard(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                      value: 'Coimbatore, India',
                      onTap: null,
                      delay: 800,
                    ),
                    _ContactCard(
                      icon: Icons.link,
                      title: 'LinkedIn',
                      value: 'linkedin.com/in/udhayachandran-balamurugan',
                      onTap: () => _launchUrl(
                        'https://linkedin.com/in/udhayachandran-balamurugan-26060b255',
                      ),
                      delay: 1000,
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// FOOTER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32),
            color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
            child: Column(
              children: [
                Text(
                  '© 2026 Udhayachandran',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Built with Flutter 3.10 & Dart 3',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;
  final int delay;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
    required this.delay,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: widget.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 280,
              padding: const EdgeInsets.all(32),
              transform: Matrix4.translationValues(
                0,
                _isHovered ? -10.0 : 0.0,
                0,
              ),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _isHovered
                      ? theme.primaryColor.withValues(alpha: 0.5)
                      : theme.dividerColor.withValues(alpha: 0.1),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withValues(
                      alpha: _isHovered ? 0.15 : 0.05,
                    ),
                    blurRadius: _isHovered ? 30 : 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.icon,
                      size: 32,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.value,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: widget.delay.ms, duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }
}
