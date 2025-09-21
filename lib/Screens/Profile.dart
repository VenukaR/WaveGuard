import 'package:flutter/material.dart';
import 'package:waveguard/Screens/editProfile.dart';
import 'package:waveguard/Screens/login_screen.dart';
import 'package:waveguard/Screens/profile/notifications.dart';
import 'package:waveguard/Screens/profile/settings.dart';
import 'package:waveguard/Screens/profile/trashtocash.dart';
import 'package:waveguard/config/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
              Stack(
                children: [
                  ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      height: 350,
                      color: AppTheme.primaryBlue, // Blue background
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
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
                  Positioned(
                    top: 200,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5DCCFC),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Sea Points
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo1.png',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 8),
                               const Text(
                                    'SEA POINTS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                              const SizedBox(height: 8),
                              const Text(
                                '590',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          // Trash2Cash
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.restore_from_trash_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(width: 8),
                              Text(
                                    'TRASH2CASH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                              SizedBox(height: 8),
                              Text(
                                '850LKR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          // Octopus Badge
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/octopus.gif',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Space for the points table overflow
              // Menu Items Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Edit Profile
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Edit Profile',
                      onTap: () {
                        // Navigate to Edit Profile screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileEdit(), // Replace with actual EditProfile screen
                          ),
                        );
                      },
                    ),
                    // const SizedBox(height: 16),
                    
                    // Personalization
                    _buildMenuItem2(
                      icon: Icons.bookmark_outline,
                      title: 'Personalization',
                      onTap: () {
                        // Navigate to Personalization screen
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileNotification(), // Replace with actual Trash2Cash screen
                          ),
                        );
                      },
                    ),
                    // const SizedBox(height: 16),
                    
                    // Trash2Cash
                    _buildMenuItem2(
                      icon: Icons.delete_outline,
                      title: 'Trash2Cash',
                      titleColor: const Color(0xFF4CAF50), // Green color for Trash2Cash
                      onTap: () {
                        // Navigate to Trash2Cash screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileTrashtoCash(), // Replace with actual Trash2Cash screen
                          ),
                        );
                      },
                    ),
                    // const SizedBox(height: 16),
                    
                    // Settings
                    _buildMenuItem2(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        // Navigate to Settings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileSettings(), // Replace with actual Settings screen
                          ),
                        );
                      },
                    ),
                    // const SizedBox(height: 16),
                    
                    // Logout
                    _buildMenuItem3(
                      icon: Icons.logout,
                      title: 'Logout',
                      titleColor: Colors.grey,
                      onTap: () {
                        // Handle logout
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(), // Replace with actual Settings screen
                          ),
                        );
                      },
                    ),
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

// Helper method to build menu items
Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? titleColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 24, color: titleColor ?? Colors.black87),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: titleColor ?? Colors.black87,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );
}
Widget _buildMenuItem2({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? titleColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 24, color: titleColor ?? Colors.black87),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: titleColor ?? Colors.black87,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );
}
Widget _buildMenuItem3({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? titleColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 24, color: titleColor ?? Colors.black87),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: titleColor ?? Colors.black87,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );
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
