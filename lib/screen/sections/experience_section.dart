import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'Experience',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),

          const ExperienceCard(
            company: 'Trice Technologies Pvt Ltd',
            role: 'Mobile Application Developer',
            description: [
              'Built end-to-end Flutter applications for enterprise and government usage.',
              'Developed systems like Waste Management, Wholesale B2B, Drug Abuse Monitoring, and Training Management.',
              'Implemented Clean Architecture, Riverpod, REST APIs, authentication, and FCM notifications.',
              'Integrated Firebase, Razorpay, geolocation, and analytics dashboards.',
              'Improved performance and created reusable, modular UI components.',
            ],
          ),
          const SizedBox(height: 32),
          const ExperienceCard(
            company: 'BNC Motors Pvt Ltd',
            role: 'Mobile Application Developer',
            description: [
              'Developed Android & iOS apps using Flutter and Ionic Angular.',
              'Built customer and internal apps for EV tracking, service booking, and device configuration.',
              'Worked on Bluetooth connectivity, Razorpay integration, and backend APIs.',
              'Implemented real-time data synchronization and third-party integrations.',
              'Collaborated with cross-functional teams for debugging and optimization.',
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company;
  final String role;
  final List<String> description;

  const ExperienceCard({
    super.key,
    required this.company,
    required this.role,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: const EdgeInsets.all(28),
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
          Text(
            company,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            role,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 20),
          ...description.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '•  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
