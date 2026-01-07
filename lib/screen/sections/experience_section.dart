import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'Professional Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            'My journey in the industry',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 60),

          const ExperienceCard(
            title: 'Mobile Application Developer – Trice Technologies',
            duration: '08/2025 - Present',
            subtitle: 'Enterprise & Government Applications',
            description: [
              'Developed and maintained end-to-end Flutter applications for enterprise and government use cases.',
              'Worked on projects including Waste Management System, Wholesale B2B, Drug Abuse Monitoring, and Training Management System.',
              'Implemented Clean Architecture, REST API integration, authentication, form validation, and push notifications.',
              'Integrated Firebase, Razorpay, geolocation, dashboards, and reusable UI components.',
              'Improved application performance, modularity, and maintainability.',
            ],
            delay: 200,
            link: 'https://tricetechnologies.in/',
          ),
          const SizedBox(height: 32),
          const ExperienceCard(
            title: 'Mobile Application Developer – BNC Motors',
            duration: '01/2024 - 07/2025',
            subtitle: 'EV & Automotive Domain',
            description: [
              'Built Android & iOS applications using Flutter and Ionic Angular.',
              'Developed customer and internal apps for vehicle tracking, service booking, and device configuration.',
              'Worked on projects including BNC Consumer App and BNC Support App.',
              'Worked on Bluetooth connectivity, payment integration, real-time data sync, and backend APIs.',
              'Collaborated with cross-functional teams to debug, optimize, and deliver features.',
            ],
            delay: 400,
            link: 'https://www.bncmotors.in/',
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String duration;
  final List<String> description;
  final int delay;
  final String? link;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.description,
    required this.delay,
    this.link,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isClickable = widget.link != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () {
          if (widget.link != null) {
            _launchUrl(widget.link!);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _isHovered
                  ? theme.primaryColor.withValues(alpha: 0.5)
                  : theme.dividerColor.withValues(alpha: 0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withValues(
                  alpha: _isHovered ? 0.1 : 0.05,
                ),
                blurRadius: _isHovered ? 30 : 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.subtitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      widget.duration,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ...widget.description.map(
                (point) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Icon(
                          Icons.arrow_right,
                          size: 20,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          point,
                          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.link != null) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Visit Website',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: widget.delay.ms, duration: 600.ms).slideY(begin: 0.2, end: 0);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
