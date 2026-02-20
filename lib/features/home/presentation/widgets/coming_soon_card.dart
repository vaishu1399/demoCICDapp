import 'package:flutter/material.dart';

/// A card widget displaying a "Coming Soon" feature with title and description.
class ComingSoonCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconName;
  final VoidCallback? onTap;

  const ComingSoonCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIconData(iconName),
                      color: Colors.blue,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Coming Soon',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Maps icon name string to IconData
  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'analytics':
        return Icons.analytics;
      case 'cloud_sync':
        return Icons.cloud_sync;
      case 'smart_toy':
        return Icons.smart_toy;
      case 'dark_mode':
        return Icons.dark_mode;
      case 'notifications':
        return Icons.notifications;
      case 'privacy_tip':
        return Icons.privacy_tip;
      default:
        return Icons.featured_play_list;
    }
  }
}
