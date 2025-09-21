import 'package:flutter/material.dart';
import 'package:waveguard/components/organization.dart';
import 'package:waveguard/components/post_card.dart';
import 'package:waveguard/config/theme.dart';

class OrganizationDetails extends StatelessWidget {
  final Organization organization;

  const OrganizationDetails({
    super.key,
    required this.organization,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
          backgroundColor: AppTheme.primaryBlue,
          foregroundColor: AppTheme.primaryWhite,
          elevation: 0,
          toolbarHeight: 0,
        ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Image.asset(
                    organization.backgroundUrl,
                    fit: BoxFit.cover,
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  // Content Overlay
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        const SizedBox(height:12),
                        Text(
                          organization.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          organization.subtitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            organization.memberCount,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                       const Text(
                    'This organization is dedicated to protecting marine life and preserving ocean ecosystems. Through various initiatives and community engagement, we work towards creating a sustainable future for our oceans.',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle join organization
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical:0),
                    ),
                    child: const Text('Join'),
                  ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Posts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  PostCard(
                    post: Post(
                      authorName: 'The Pearl Protectors',
                      authorAvatar: 'assets/images/Profile.png',
                      timeAgo: '2 hours ago',
                      content: 'Join us this weekend for our beach cleanup event at Mount Lavinia! Together, we can make a difference. 🌊 #SaveOurOceans #BeachCleanup',
                      imageUrl: 'assets/images/clean.png',
                      likes: 128,
                      comments: 24,
                      shares: 15,
                    ),
                  ),
                  PostCard(
                    post: Post(
                      authorName: 'The Pearl Protectors',
                      authorAvatar: 'assets/images/Profile.png',
                      timeAgo: '1 day ago',
                      content: 'Did you know? A single plastic bag can take up to 1,000 years to decompose in the ocean. Let\'s reduce our plastic usage! 🌏 #MarineLife #Sustainability',
                      likes: 256,
                      comments: 42,
                      shares: 73,
                    ),
                  ),
                  PostCard(
                    post: Post(
                      authorName: 'The Pearl Protectors',
                      authorAvatar: 'assets/images/Profile.png',
                      timeAgo: '2 days ago',
                      content: 'Amazing turnout at today\'s marine life awareness workshop! Thank you to all participants for their enthusiasm in learning about ocean conservation. 🐋',
                      imageUrl: 'assets/images/dolphin.png',
                      likes: 342,
                      comments: 28,
                      shares: 45,
                    ),
                  ),
                  PostCard(
                    post: Post(
                      authorName: 'The Pearl Protectors',
                      authorAvatar: 'assets/images/Profile.png',
                      timeAgo: '3 days ago',
                      content: 'Exciting news! Our new coral restoration project has successfully planted 100 new coral fragments this month. Together, we\'re rebuilding our marine ecosystems! 🐠',
                      imageUrl: 'assets/images/water.png',
                      likes: 421,
                      comments: 56,
                      shares: 89,
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