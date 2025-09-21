import 'package:flutter/material.dart';
import 'package:waveguard/components/organization.dart';
import 'package:waveguard/config/theme.dart';
import 'package:waveguard/Screens/OrganizationDetails.dart';

class Community extends StatelessWidget {
  const Community({super.key});

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
                                              color: const Color(0xFF4A90E2),
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
                              const SizedBox(height: 20),
                            ])),
                  ),
                ),
                //title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Communities',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.filter_list,
                        color: Colors.black,
                        size: 22,
                      ),
                    ],
                  ),
                ),
                
                 //organization list
                 Padding(
                   padding: const EdgeInsets.only(top: 16),
                   child: OrganizationsList(
                     onOrganizationTap: (organization) {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => OrganizationDetails(
                             organization: organization,
                           ),
                         ),
                       );
                     },
                   ),
                 ),
              ],
            ),
          ),
      )
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
