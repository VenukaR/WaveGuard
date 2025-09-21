import 'package:flutter/material.dart';
import 'package:waveguard/config/theme.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({super.key});

  Widget _buildFilterButton(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? AppTheme.primaryBlue : Colors.white,
          foregroundColor: isActive ? Colors.white : Colors.black54,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isActive ? Colors.transparent : Colors.grey.shade300,
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildNotificationItem(
    String initials,
    String title,
    String message,
    String time, {
    int? badgeCount,
    bool isRead = false,
    required Color backgroundColor,
    bool showUserIcon = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          // Avatar or initials
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: showUserIcon
                  ? const Icon(Icons.person, color: Colors.white, size: 24)
                  : Text(
                      initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 15),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Time and badge
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              if (badgeCount != null) ...[
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ] else if (isRead) ...[
                const SizedBox(height: 5),
                const Icon(
                  Icons.check,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

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
                    // Header with search
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Notifications',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black54),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Filter buttons
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildFilterButton('All', true),
                          _buildFilterButton('Beach Alerts', false),
                          _buildFilterButton('Cleanup', false),
                          _buildFilterButton('other', false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Today's notifications
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildNotificationItem(
                      'GTC',
                      'Guard the Corals',
                      'Coral bleaching detected at Reef Point...',
                      '18:31',
                      badgeCount: 2,
                      backgroundColor: const Color(0xFFFFC107),
                    ),
                    _buildNotificationItem(
                      'CSC',
                      'Clean Shores Crew',
                      'Weekend cleanup confirmed at Go...',
                      '17:21',
                      isRead: true,
                      backgroundColor: const Color(0xFF64B5F6),
                    ),
                    _buildNotificationItem(
                      'A',
                      'Turtle Nesting Alert',
                      'turtle nesting in progress near Co...',
                      '12:33',
                      badgeCount: 1,
                      backgroundColor: Colors.redAccent,
                    ),
                    _buildNotificationItem(
                      'CSC',
                      'Clean Shores Crew',
                      'Turtle rescue workshop tomorrow...',
                      '11:31',
                      badgeCount: 1,
                      backgroundColor: const Color(0xFF64B5F6),
                    ),
                    const SizedBox(height: 20),
                    // Yesterday's notifications
                    const Text(
                      'Yesterday',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildNotificationItem(
                      'FOB',
                      'Friends of Blue',
                      'Marine talk tonight: \'Plastic...\'',
                      '8:51',
                      isRead: true,
                      backgroundColor: const Color(0xFFFFB74D),
                    ),
                    _buildNotificationItem(
                      '',
                      'Community Cleanup Drive',
                      'Join the beach cleanup at Go...',
                      '7:44',
                      backgroundColor: const Color(0xFF81C784),
                      showUserIcon: true,
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
