import 'package:flutter/material.dart';
import 'package:waveguard/components/organization.dart';
import 'package:waveguard/config/theme.dart';

class CommunityCard extends StatelessWidget {
  final String memberCount;
  final String title;
  final String organization;
  final String backgroundImage;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  const CommunityCard({
    super.key,
    required this.memberCount,
    required this.title,
    required this.organization,
    required this.backgroundImage,
    this.isBookmarked = false,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Members count at top left
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryWhite.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$memberCount MEMBERS',
                style: const TextStyle(
                  color: AppTheme.primaryWhite,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Bookmark button
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onBookmarkTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: AppTheme.primaryWhite,
                  size: 24,
                ),
              ),
            ),
          ),
          // Title and organization centered
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppTheme.primaryWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    organization,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppTheme.primaryWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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