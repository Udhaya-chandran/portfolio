import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            company: 'Trice Technologies Pvt Ltd',
            role: 'Mobile Application Developer',
            duration: '08/2025 - Present',
            description: [
              'Built end-to-end Flutter applications for enterprise and government usage.',
              'Developed systems like Waste Management, Wholesale B2B, Drug Abuse Monitoring, and Training Management.',
              'Implemented Clean Architecture, Riverpod, REST APIs, authentication, and FCM notifications.',
              'Integrated Firebase, Razorpay, geolocation, and analytics dashboards.',
              'Improved performance and created reusable, modular UI components.',
            ],
            delay: 400,
          ),
          const SizedBox(height: 32),
          const ExperienceCard(
            company: 'BNC Motors Pvt Ltd',
            role: 'Mobile Application Developer',
            duration: '01/2024 - 07/2025',
            description: [
              'Developed Android & iOS apps using Flutter and Ionic Angular.',
              'Built customer and internal apps for EV tracking, service booking, and device configuration.',
              'Worked on Bluetooth connectivity, Razorpay integration, and backend APIs.',
              'Implemented real-time data synchronization and third-party integrations.',
              'Collaborated with cross-functional teams for debugging and optimization.',
            ],
            delay: 600,
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company;
  final String role;
  final String duration;
  final List<String> description;
  final int delay;

  const ExperienceCard({
    super.key,
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha : 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha : 0.05),
            blurRadius: 20,
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
                      company,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha : 0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  duration,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...description.map(
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
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      point,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms, duration: 600.ms).slideY(begin: 0.2, end: 0);
  }
}
