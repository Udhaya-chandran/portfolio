import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Responsive(mobile: _HeroMobile(), desktop: _HeroDesktop()),
    );
  }
}

class _HeroMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ProfileImage(),
          const SizedBox(height: 32),
          _HeroText(textAlign: TextAlign.center),
          const SizedBox(height: 32),
          _HeroButtons(alignment: WrapAlignment.center),
        ],
      ),
    );
  }
}

class _HeroDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroText(textAlign: TextAlign.left),
                const SizedBox(height: 48),
                _HeroButtons(alignment: WrapAlignment.start),
              ],
            ),
          ),
          const SizedBox(width: 60),
          _ProfileImage(),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        border: Border.all(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.person_rounded,
          size: 140,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack);
  }
}

class _HeroText extends StatelessWidget {
  final TextAlign textAlign;

  const _HeroText({required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Hello, I\'m',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).primaryColor,
            letterSpacing: 1.2,
          ),
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 12),
        Text(
          'Udhayachandran B',
          textAlign: textAlign,
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(height: 1.1),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        Text(
          'Mobile Application Developer,\nBuilding scalable cross-platform apps using Flutter',
          textAlign: textAlign,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 32,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Text(
                'Mobile Application Developer with 2 years of experience building production-ready cross-platform applications using Flutter',
                textAlign: textAlign,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
              SizedBox(height: 5),
              Text(
                'I have worked on enterprise and government applications, contributing to complete feature development including UI, API integration, authentication, and state management.',
                textAlign: textAlign,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
              SizedBox(height: 5),
              Text(
                'Strong experience in Clean Architecture, Riverpod/BLoC, Firebase, REST APIs, and performance-focused UI development. ',
                textAlign: textAlign,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
              SizedBox(height: 5),
              Text(
                'Comfortable working independently, owning modules end-to-end, and collaborating in Agile teams to deliver maintainable and scalable mobile solutions.',
                textAlign: textAlign,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
      ],
    );
  }
}

class _HeroButtons extends StatelessWidget {
  final WrapAlignment alignment;

  const _HeroButtons({required this.alignment});

  void _downloadResume() {
    if (kIsWeb) {
      final anchor = html.AnchorElement(href: 'assets/assets/resume.pdf')
        ..target = 'blank'
        ..download = 'Udhayachandran_Resume.pdf';
      anchor.click();
    } else {
      _launchUrl('assets/resume.pdf');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      alignment: alignment,
      children: [
        ElevatedButton(
          onPressed: _downloadResume,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Resume'),
        ),
        OutlinedButton(
          onPressed: () => _launchUrl(
            'https://linkedin.com/in/udhayachandran-balamurugan-26060b255',
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('LinkedIn'),
        ),
      ],
    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0);
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
