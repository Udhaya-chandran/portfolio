import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Feel free to reach out for opportunities, collaborations, or discussions.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),

          /// CONTACT CARDS
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _ContactCard(
                icon: Icons.email_outlined,
                title: 'Email',
                value: 'udhayachandranbalamurugan@gmail.com',
                onTap: () =>
                    _launchUrl('mailto:udhayachandranbalamurugan@gmail.com'),
              ),
              _ContactCard(
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: '+91 9976156907',
                onTap: () => _launchUrl('tel:+919976156907'),
              ),
              _ContactCard(
                icon: Icons.location_on_outlined,
                title: 'Location',
                value: 'Coimbatore, India',
                onTap: null,
              ),
              _ContactCard(
                icon: Icons.link,
                title: 'LinkedIn',
                value: 'linkedin.com/in/udhayachandran-balamurugan',
                onTap: () => _launchUrl(
                  'https://linkedin.com/in/udhayachandran-balamurugan-26060b255',
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          /// FOOTER
          const Divider(),
          const SizedBox(height: 16),
          Text(
            '© 2026 Udhayachandran B · Built with Flutter',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
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

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
