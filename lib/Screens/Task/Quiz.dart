import 'package:flutter/material.dart';
import 'package:waveguard/components/task.dart';
import 'package:waveguard/config/theme.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: AppTheme.primaryWhite,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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

                const TaskCard(
                  title: 'Plastic Saved',
                  dateRange: '19/08/2025 - 19/09/25',
                  description:
                      'Collect 15kg of plastic from the beach and recycle it through Wave Guard machines.',
                  progress: 0.80, // 80% progress
                  currentValue: '12kg',
                  targetValue: '15kg',
                  rewardAmount: '50',
                  rewardType: 'Trash2Cash',
                  // Optional: you can also customize the progress color
                  // progressColor: Color(0xFF7ED957),
                ),
                const TaskCard(
                  title: 'Sea Knowledge Explorer',
                  dateRange: '19/08/2025 - 19/09/25',
                  description:
                      'Read 5 articles about marine life and ocean conservation to expand your knowledge of the sea',
                  progress: 0.1, // 10% progress
                  currentValue: '1',
                  targetValue: '5',
                  rewardAmount: '40',
                  rewardType: 'WavePoints',
                  // Optional: you can also customize the progress color
                  progressColor: Color.fromARGB(255, 217, 87, 87),
                ),
                const TaskCard(
                  title: 'Beach Cleanup Volunteer',
                  dateRange: '19/08/2025 - 19/09/25',
                  description:
                      'Participate in 3 beach cleanup events organized by Wave Guard to help keep our beaches clean and safe for marine life.',
                  progress: 0.66, // 66% progress
                  currentValue: '2',
                  targetValue: '3',
                  rewardAmount: '70',
                  rewardType: 'Trash2Cash',
                  // Optional: you can also customize the progress color
                  progressColor: Color(0xFF4A90E2),
                ),

              ],
            ),
          ),
        ));
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
