import 'package:flutter/material.dart';
import 'package:waveguard/config/theme.dart';
import 'package:waveguard/components/article_card.dart';
import 'package:waveguard/Screens/Learn/article_details.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        backgroundColor: AppTheme.primaryBlue,
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

              //Main Article Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Learn with Articles',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: AppTheme.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      article: Article(
                        title: 'The Secret Life of Starfish',
                        author: 'Danuka Perera',
                        date: '12 Sep 2025',
                        thumbnail: 'assets/images/starfish.png',
                        status: 'Finished',
                        content:
                            'Discover the fascinating world of starfish and their important role in marine ecosystems...',
                        authorAvatar: 'assets/images/Profile.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetails(
                              article: Article(
                                title: 'The Secret Life of Starfish',
                                author: 'Danuka Perera',
                                date: '12 Sep 2025',
                                thumbnail: 'assets/images/starfish.png',
                                status: 'Finished',
                                content: '''
Starfish, also known as sea stars, are fascinating creatures that have captivated marine biologists and ocean enthusiasts for generations. These remarkable echinoderms play a crucial role in maintaining the balance of marine ecosystems.

Despite their name, starfish are not actually fish at all. They are complex invertebrates that have evolved unique adaptations for life under the sea. One of their most remarkable features is their ability to regenerate lost limbs, and in some cases, even regenerate an entire new starfish from a single arm.

These amazing creatures use their hundreds of tiny tube feet not only for movement but also for catching prey. They can even turn their stomachs inside out to digest food outside their body! This unique feeding method allows them to prey on mollusks and other shellfish that would otherwise be protected by their hard shells.

Starfish are found in all the world's oceans, from tropical coral reefs to the cold seafloor of the Arctic. They come in an astounding variety of colors and patterns, from brilliant blues and reds to subtle browns and greys, each adapted to their specific habitat.

Conservation of these remarkable animals is crucial as they face threats from pollution, habitat destruction, and climate change. By understanding and protecting starfish, we help maintain the delicate balance of our ocean ecosystems.
                                  ''',
                                authorAvatar: 'assets/images/Profile.png',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Most Liked',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: AppTheme.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 200,
                            width:200,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                            color: AppTheme.primaryWhite,
                                            borderRadius:
                                                BorderRadius.circular(12),

                                          ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text('Protect Our Ocean', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                                SizedBox(height: 5),
                                Text('Join us in safeguarding marine life...', style: TextStyle(fontSize: 14, color: Colors.black),),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                  // Author name
                                  Text(
                                    "Dhanuka Perera ",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                  // Add a gif
                                  SizedBox(width: 6),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                    'assets/images/cactus.gif',
                                    width: 28,
                                    height: 28,
                                    fit: BoxFit.cover,
                                    ),
                                  ),
                                  ],
                                )
                                ]
                            )
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 200,
                            width:200,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                            color: AppTheme.primaryWhite,
                                            borderRadius:
                                                BorderRadius.circular(12),

                                          ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text('Beaches Without Waste', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                                SizedBox(height: 5),
                                Text('Beaches are a place not to litter...', style: TextStyle(fontSize: 14, color: Colors.black),),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                  // Author name
                                  Text(
                                    "Gayan Perera ",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                  // Add a gif
                                  SizedBox(width: 6),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                    'assets/images/shell.gif',
                                    width: 28,
                                    height: 28,
                                    fit: BoxFit.cover,
                                    ),
                                  ),
                                  ],
                                )
                                ]
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    ArticleCard(
                      article: Article(
                        title: 'From Shore to Sea',
                        author: 'Deshan Sanga',
                        date: '08 Sep 2025',
                        thumbnail: 'assets/images/water.png',
                        status: 'Reading',
                        content:
                            'Explore the incredible journey of water from our beaches to the deep ocean...',
                        authorAvatar: 'assets/images/Profile.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetails(
                              article: Article(
                                title: 'From Shore to Sea',
                                author: 'Deshan Sanga',
                                date: '08 Sep 2025',
                                thumbnail: 'assets/images/water.png',
                                status: 'Reading',
                                content:
                                    'Detailed content about the journey of water...',
                                authorAvatar: 'assets/images/Profile.png',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ArticleCard(
                      article: Article(
                        title: 'Guardians of the Sea',
                        author: 'Dinuka Sara',
                        date: '31 Aug 2025',
                        thumbnail: 'assets/images/dolphin.png',
                        status: 'Reading',
                        content:
                            'Meet the marine mammals that help maintain ocean health...',
                        authorAvatar: 'assets/images/Profile.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetails(
                              article: Article(
                                title: 'Guardians of the Sea',
                                author: 'Dinuka Sara',
                                date: '31 Aug 2025',
                                thumbnail: 'assets/images/dolphin.png',
                                status: 'Reading',
                                content:
                                    'Detailed content about marine mammals...',
                                authorAvatar: 'assets/images/Profile.png',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],

            // ],
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
