import 'package:flutter/material.dart';
import 'package:waveguard/config/theme.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: AppTheme.primaryWhite,
        elevation: 0,
        // toolbarHeight: 56, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryWhite),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Stack(
                children: [
                  ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      height: 150,
                      color: AppTheme.primaryBlue, // Blue background
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height:0),
                            Row(
                              children: [
                                // User Avatar with badge
                                Stack(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFF8A65),
                                        borderRadius: BorderRadius.circular(70),
                                        border: Border.all(
                                          color: AppTheme.primaryWhite,
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image.asset(
                                          'assets/images/Profile.png',
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Badge
                                    Positioned(
                                      top: -2,
                                      right: -2,
                                      child: Container(
                                        width: 33,
                                        height: 33,
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
                                 Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //online indicator
                                     Container(
                                       width: 80,
                                       height: 20,
                                      padding: const EdgeInsets.symmetric(horizontal:10, vertical: 2),
                                       decoration: BoxDecoration(
                                         color: const Color.fromARGB(93, 197, 197, 197),
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child: Row(
                                        children: [
                                          const SizedBox(width: 4),
                                          const Text(
                                            'Online',
                                            style: TextStyle(
                                              color: AppTheme.primaryWhite,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(width: 7,),
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF7ED957),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                          ),
                                        ],
                                       )
                                     ),
                                      const Text(
                                        'Sam Perera',
                                        style: TextStyle(
                                          color: AppTheme.primaryWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'samperera@gmail.com',
                                        style: TextStyle(
                                          color: AppTheme.primaryWhite,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Points Table
                ],
              ),
              const SizedBox(height: 40), // Space for the points table overflow
              // Menu Items Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Notification Settings
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Notification Settings'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    // Language
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Language'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('English', style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 8),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    const Divider(),
                    // Location
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Location'),
                      trailing: Switch(
                        value: true,
                        onChanged: (bool value) {},
                        activeColor: AppTheme.primaryBlue,
                      ),
                    ),
                    const Divider(),
                    // Dark Mode
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Activate Dark Mode'),
                      trailing: Switch(
                        value: false,
                        onChanged: (bool value) {},
                        activeColor: AppTheme.primaryBlue,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 20),
                    // Other Section
                    const Text(
                      'Other',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Privacy Policy
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    // Terms and Conditions
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Terms and Conditions'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    // Version
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Version'),
                      trailing: Text('v01.01', style: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 20),
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

    // Start at top-left
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Right edge down (≈ 227.469 of 285 = 0.8)
    path.lineTo(size.width, size.height * 0.8);

    // First curve
    path.cubicTo(
      size.width, size.height * 0.8,          // control point 1 (same X at right edge)
      size.width * 0.37, size.height * 0.55,  // control point 2 (159/431, 158/285)
      size.width * 0.39, size.height * 0.87,  // end point (169/431, 249/285)
    );

    // Second curve
    path.cubicTo(
      size.width * 0.42, size.height * 1.2,   // control point 1 (179/431, 341/285)
      0, size.height * 0.8,                   // control point 2 (0, 227/285)
      0, size.height * 0.8,                   // end point (0, 227/285)
    );

    // Close shape
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
