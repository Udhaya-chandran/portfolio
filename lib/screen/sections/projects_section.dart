import 'package:flutter/material.dart';

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
            'Projects',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              ProjectCard(
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
                tag: 'Enterprise Project',
              ),
              ProjectCard(
                title: 'Wholesale B2B System',
                description:
                    'Sales and order management app enabling shop visits, order creation, inventory sync, and invoice tracking.',
                tech: ['Flutter', 'REST APIs', 'Clean Architecture'],
                tag: 'Enterprise Project',
              ),
              ProjectCard(
                title: 'Drug Abuse Monitoring App',
                description:
                    'Confidential reporting platform for schools and colleges with anonymous submission and secure communication.',
                tech: ['Flutter', 'Firebase', 'Secure APIs'],
                tag: 'Government Project',
              ),
              ProjectCard(
                title: 'Training Management System',
                description:
                    'Complete training platform with dashboard, staff, students, attendance, payments, and course management.',
                tech: ['Flutter', 'Riverpod', 'Clean Architecture'],
                tag: 'Enterprise Project',
              ),
              ProjectCard(
                title: 'BNC Consumer App',
                description:
                    'Customer-facing EV application providing live vehicle tracking, battery swapping, payments, and service booking.',
                tech: ['Flutter', 'Razorpay', 'Live Tracking'],
                tag: 'Production App',
              ),
              ProjectCard(
                title: 'BNC Support App',
                description:
                    'Internal service app for EV diagnostics, Bluetooth device configuration, alerts, and complaint handling.',
                tech: ['Flutter', 'Bluetooth', 'Realtime Sync'],
                tag: 'Internal Tool',
              ),
              ProjectCard(
                title: 'CRM Web Application',
                description:
                    'Web-based CRM system with RESTful backend, customer management, and scalable modular architecture.',
                tech: ['Node.js', 'Express', 'MySQL', 'Sequelize'],
                tag: 'Web Application',
              ),
              ProjectCard(
                title: 'Personal Flutter Projects',
                description:
                    'Weather App (BLoC), To-Do App (Hive), and Calculator with clean UI and scalable state management.',
                tech: ['Flutter', 'BLoC', 'Hive'],
                tag: 'Personal Projects',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tech;
  final String tag;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tech,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TAG
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(tag, style: Theme.of(context).textTheme.labelSmall),
          ),
          const SizedBox(height: 16),

          /// TITLE
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          /// DESCRIPTION
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),

          /// TECH STACK
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech
                .map(
                  (item) => Chip(
                    label: Text(item),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
