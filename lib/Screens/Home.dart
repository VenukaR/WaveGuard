import 'package:flutter/material.dart';
import 'package:waveguard/config/theme.dart';
import 'package:waveguard/components/slide.dart';
import 'package:waveguard/components/community_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF4A90E2),/
      appBar: AppBar(
        backgroundColor: AppTheme.primaryBlue,
        // Color.fromARGB(255, 12, 14, 17), --- IGNORE ---
        foregroundColor: AppTheme.primaryWhite,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 140,
                  color: AppTheme.primaryBlue, // Blue background
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // User Avatar with badge
                                Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFF8A65),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: AppTheme.primaryWhite,
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image.asset(
                                          'assets/images/Profile.png',
                                          width: 14,
                                          height: 14,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Badge
                                    Positioned(
                                      top: -2,
                                      right: -2,
                                      child: Container(
                                        width: 29,
                                        height: 29,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryWhite,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Color(0xFF4A90E2),
                                            width: 1,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          child: Image.asset(
                                            'assets/images/octopus.gif',
                                            width: 14,
                                            height: 14,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 15),

                                // Greeting Text
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Good Evening,',
                                        style: TextStyle(
                                          color: AppTheme.primaryWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Sam Perera',
                                        style: TextStyle(
                                          color: AppTheme.primaryWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Notification Icon
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.notifications_outlined,
                                    color: AppTheme.primaryWhite,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ])),
                ),
              ),
              // Main Content
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Beach Cleanup Slideshow
                    // const BeachCleanupSlideshow(),
                    const SlideWidget(),

                    const SizedBox(height: 30),

                    // Daily Challenges Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Daily Challenges',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'View all >',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4A90E2),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Plastic Saved Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Plastic Saved',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                Text(
                                  '${DateTime.now().year}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().day.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  '12kg',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.shade800,
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0.6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: const Color(0xFF4CAF50),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 0),
                                const Text(
                                  '250 Eco Points',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Image.asset(
                            'assets/images/water.png',
                            width: 110,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Join With Communities Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Join With Communities',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'View all >',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4A90E2),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Community Cards
                    Column(
                      children: [
                        // Protect Sea Life Community
                        CommunityCard(
                          memberCount: '100+',
                          title: 'Protect Sea Life',
                          organization: 'The Pearl Protectors',
                          backgroundImage: 'assets/images/join1.png',
                          onBookmarkTap: () {
                            // Handle bookmark tap
                          },
                        ),

                        // Guard the Corals Community
                        CommunityCard(
                          memberCount: '50+',
                          title: 'Guard the Corals',
                          organization: 'Clean Ocean Force (COF)',
                          backgroundImage: 'assets/images/join2.png',
                          onBookmarkTap: () {
                            // Handle bookmark tap
                          },
                        ),
                        CommunityCard(
                          memberCount: '50+',
                          title: 'Guard the Corals',
                          organization: 'Clean Ocean Force (COF)',
                          backgroundImage: 'assets/images/join3.png',
                          onBookmarkTap: () {
                            // Handle bookmark tap
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Articles',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'View all >',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4A90E2),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/article.png',
                      width: double.infinity,
                    ),
                    const SizedBox(
                        height: 30), // Bottom padding for navigation bar
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start top-left
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Right edge down
    path.lineTo(size.width, size.height * 0.75);

    // Bottom curve (translated from SVG)
    path.cubicTo(
      size.width, size.height * 0.75, // first control point (x1, y1)
      size.width * 0.38, size.height * 0.47, // second control point (x2, y2)
      size.width * 0.56, size.height * 0.85, // end point (x, y)
    );

    path.cubicTo(
      size.width * 0.74, size.height * 1.23, // first control point (x1, y1)
      0, size.height * 0.75, // second control point (x2, y2)
      0, size.height * 0.75, // end point (x, y)
    );

    // Close back to top-left
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
