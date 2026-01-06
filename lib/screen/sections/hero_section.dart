import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'Udhayachandran B',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            'Mobile Application Developer (Flutter)',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: Text(
              'Mobile Application Developer with 2 years of experience '
              'building scalable cross-platform applications using Flutter for '
              'government and enterprise clients. Skilled in Clean Architecture, '
              'Riverpod, REST APIs, and Firebase.',
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _launchUrl('assets/resume.pdf'),
                child: const Text('Download Resume'),
              ),
              OutlinedButton(
                onPressed: () => _launchUrl(
                  'https://linkedin.com/in/udhayachandran-balamurugan-26060b255',
                ),
                child: const Text('LinkedIn'),
              ),
            ],
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
