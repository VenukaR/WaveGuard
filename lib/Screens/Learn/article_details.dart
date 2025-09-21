import 'package:flutter/material.dart';
import 'package:waveguard/components/article_card.dart';
import 'package:waveguard/config/theme.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;

  const ArticleDetails({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: 
                AppTheme.primaryBlue, // Set a background color for the AppBar  
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              article.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.primaryBlue, AppTheme.primaryBlue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // Main image
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        article.thumbnail,
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content below
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Likes + Comments row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _StatItem(
                      count: "242",
                      icon: Icons.favorite,
                      color: const Color(0xFF4A90E2),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey[300],
                    ),
                    _StatItem(
                      count: "177",
                      icon: Icons.comment,
                      color: const Color(0xFF4A90E2),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Author row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(article.authorAvatar),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.author,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            article.date,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Content text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    article.content,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Extra images
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _ExtraImage("assets/images/clean.png"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ExtraImage("assets/images/clean2.png"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Icon(icon, color: Colors.grey[500]),
      ],
    );
  }
}

class _ExtraImage extends StatelessWidget {
  final String path;

  const _ExtraImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
