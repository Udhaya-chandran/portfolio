import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

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
                description: [
                  'Built a production-grade Flutter application for managing waste pickup operations.',
                  'Implemented location-based booking and navigation using Google Maps.',
                  'Designed a complete agent workflow including route assignment, pickup status updates, and disposal reporting.',
                  'Integrated Razorpay payments and ensured secure backend communication.',
                ],
                tech: [
                  'Flutter',
                  'Google Maps',
                  'Razorpay',
                  'Firebase',
                  'REST APIs',
                ],
                tag: 'Enterprise App',
                color: Colors.green,
                delay: 100,
              ),
              _ProjectCard(
                title: 'Drug Abuse Monitoring (DAM)',
                description: [
                  'Developed a confidential reporting application to monitor and prevent illegal activities in schools and colleges.',
                  'Implemented anonymous report submission with a minimal, distraction-free UI.',
                  'Ensured secure backend communication and enabled authorities to initiate counseling and follow-up actions.',
                ],
                tech: ['Flutter', 'Firebase', 'Secure APIs'],
                tag: 'Government',
                color: Colors.red,
                delay: 300,
              ),
              _ProjectCard(
                title: 'CRM Web Application',
                description: [
                  'Built a web-based CRM system for managing customer interactions and support operations.',
                  'Developed RESTful backend APIs using Node.js and Express.js.',
                  'Used Sequelize ORM for optimized interaction with MySQL.',
                  'Designed a clean and modular architecture focused on scalability and maintainability.',
                ],
                tech: ['Node.js', 'Express', 'MySQL', 'Sequelize'],
                tag: 'Web App',
                color: Colors.indigo,
                delay: 600,
              ),
              _ProjectCard(
                title: 'BNC Consumer App',
                description: [
                  'Built a customer-facing mobile application for electric vehicle tracking and service management.',
                  'Implemented live vehicle tracking and daily trip visibility for users.',
                  'Developed battery swapping workflows and integrated Razorpay payment processing.',
                  'Added complaint management and vehicle service booking features.',
                ],
                tech: ['Flutter', 'Razorpay', 'Live Tracking'],
                tag: 'EV Customer App',
                color: Colors.orange,
                delay: 400,
                link:
                    'https://play.google.com/store/apps/details?id=com.org.bnc&pcampaignid=web_share',
              ),

              _ProjectCard(
                title: 'BNC Support App',
                description: [
                  'Developed an internal application for service engineers to monitor EV diagnostics and device status.',
                  'Enabled real-time visibility of customer complaints and battery alerts.',
                  'Implemented Bluetooth-based device configuration, speedometer value updates, and vehicle mode toggling.',
                ],
                tech: ['Flutter', 'Bluetooth', 'Realtime Sync'],
                tag: 'Internal Service',
                color: Colors.teal,
                delay: 500,
              ),
              _ProjectCard(
                title: 'Wholesale B2B System',
                description: [
                  'Developed a sales workflow application for managing shops, orders, and invoices.',
                  'Implemented real-time inventory and order synchronization using REST APIs.',
                  'Enabled seamless CRUD operations with reliable backend data consistency.',
                ],
                tech: ['Flutter', 'REST APIs', 'Clean Architecture'],
                tag: 'B2B System',
                color: Colors.blue,
                delay: 200,
              ),
            ],
          ),
          const SizedBox(height: 80),
          Text(
            'Personal Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            'Explore my open-source contributions',
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
                title: 'Weather App',
                description: [
                  'Displays real-time weather using OpenWeatherMap API.',
                  'Built using Flutter + BLoC for clean and scalable architecture.',
                ],
                tech: ['Flutter', 'BLoC', 'API'],
                tag: 'Personal',
                color: Colors.cyan,
                delay: 100,
                link: 'https://github.com/udhayachandran03/flutter_weather_app',
              ),
              _ProjectCard(
                title: 'To-Do App',
                description: [
                  'Offline local storage using Hive.',
                  'CRUD operations with simple and clean UI.',
                ],
                tech: ['Flutter', 'Hive', 'Local Storage'],
                tag: 'Personal',
                color: Colors.purple,
                delay: 200,
                link: 'https://github.com/udhayachandran03/simpleTodo',
              ),
              _ProjectCard(
                title: 'Simple Calculator',
                description: [
                  'Flutter-based calculator with basic arithmetic operations.',
                  'Lightweight UI and precise calculation handling.',
                ],
                tech: ['Flutter', 'Dart', 'UI/UX'],
                tag: 'Personal',
                color: Colors.deepOrange,
                delay: 300,
                link: 'https://github.com/udhayachandran03/simple-Calculator',
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
  final List<String> description;
  final List<String> tech;
  final String tag;
  final Color color;
  final int delay;
  final String? link;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    required this.tag,
    required this.color,
    required this.delay,
    this.link,
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
    final isClickable = widget.link != null;

    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: isClickable
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: GestureDetector(
            onTap: () {
              if (widget.link != null) {
                _launchUrl(widget.link!);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 380, // Slightly increased width for better text flow
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
                mainAxisSize: MainAxisSize.min, // Allow height to adapt
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
                  ),
                  const SizedBox(height: 16),
                  ...widget.description.map(
                    (point) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              point,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                  if (widget.link != null) ...[
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'View Project',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: widget.color,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: widget.delay.ms, duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
