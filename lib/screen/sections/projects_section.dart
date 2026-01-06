import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            'Highlights of my recent work',
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
              _ProjectCard(
                title: 'Waste Management System',
                description:
                    'Smart waste collection system for agents and customers with location-based pickup booking, route navigation, and reporting.',
                tech: [
                  'Flutter',
                  'Google Maps',
                  'Razorpay',
                  'Firebase',
                  'REST APIs',
                ],
                tag: 'Enterprise',
                color: Colors.green,
                delay: 200,
              ),
              _ProjectCard(
                title: 'Wholesale B2B System',
                description:
                    'Sales and order management app enabling shop visits, order creation, inventory sync, and invoice tracking.',
                tech: ['Flutter', 'REST APIs', 'Clean Architecture'],
                tag: 'Enterprise',
                color: Colors.blue,
                delay: 400,
              ),
              _ProjectCard(
                title: 'Drug Abuse Monitoring App',
                description:
                    'Confidential reporting platform for schools and colleges with anonymous submission and secure communication.',
                tech: ['Flutter', 'Firebase', 'Secure APIs'],
                tag: 'Government',
                color: Colors.red,
                delay: 600,
              ),
              _ProjectCard(
                title: 'Training Management \nSystem',
                description:
                    'Complete training platform with dashboard, staff, students, attendance, payments, and course management.',
                tech: ['Flutter', 'Riverpod', 'Clean Architecture'],
                tag: 'Enterprise',
                color: Colors.purple,
                delay: 800,
              ),
              _ProjectCard(
                title: 'BNC Consumer App',
                description:
                    'Customer-facing EV application providing live vehicle tracking, battery swapping, payments, and service booking.',
                tech: ['Flutter', 'Razorpay', 'Live Tracking'],
                tag: 'Production',
                color: Colors.orange,
                delay: 1000,
              ),
              _ProjectCard(
                title: 'BNC Support App',
                description:
                    'Internal service app for EV diagnostics, Bluetooth device configuration, alerts, and complaint handling.',
                tech: ['Flutter', 'Bluetooth', 'Realtime Sync'],
                tag: 'Internal',
                color: Colors.teal,
                delay: 1200,
              ),
              _ProjectCard(
                title: 'CRM Web Application',
                description:
                    'Web-based CRM system with RESTful backend, customer management, and scalable modular architecture.',
                tech: ['Node.js', 'Express', 'MySQL', 'Sequelize'],
                tag: 'Web',
                color: Colors.indigo,
                delay: 1400,
              ),
              _ProjectCard(
                title: 'Personal Flutter Projects',
                description:
                    'Weather App (BLoC), To-Do App (Hive), and Calculator with clean UI and scalable state management.',
                tech: ['Flutter', 'BLoC', 'Hive'],
                tag: 'Personal',
                color: Colors.amber,
                delay: 1600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tech;
  final String tag;
  final Color color;
  final int delay;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    required this.tag,
    required this.color,
    required this.delay,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
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
            width: 340,
            height: 340, // Fixed height for consistency
            padding: const EdgeInsets.all(24),
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
                    ? widget.color.withValues(alpha: 0.5)
                    : theme.dividerColor.withValues(alpha: 0.1),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(
                    alpha: _isHovered ? 0.15 : 0.05,
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
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: widget.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        widget.tag,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: widget.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_outward_rounded,
                      color: _isHovered ? widget.color : theme.disabledColor,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  widget.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    widget.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: theme.colorScheme.secondary,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.tech.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.05)
                            : Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(delay: widget.delay.ms, duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }
}
