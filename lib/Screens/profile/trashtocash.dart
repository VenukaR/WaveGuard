
import 'package:flutter/material.dart';
import 'package:waveguard/config/theme.dart';

class ProfileTrashtoCash extends StatelessWidget {
  const ProfileTrashtoCash({super.key});

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
                      height: 300,
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
                  Positioned(
                    top: 150,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 233, 34),
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
                          const SizedBox(width:10),
                          //line
                          Container(
                            width: 1,
                            height: 80,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          const SizedBox(width:10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("140021Trash2CashID",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text("Withdraw Your Earnings",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset(
                                'assets/images/payment.png',
                                width: 200,
                                // height: 80,
                                fit: BoxFit.cover,
                              ),
                            ]
                          )
                        ],
                      ),
                    ),
                  ),
                  // Points Table
                ],
              ),
              const SizedBox(height: 40), // Space for the points table overflow
              // Menu Items Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  ],
                ),
              ),
              const SizedBox(height: 0), // Bottom spacing
              Padding(padding: const EdgeInsets.all(12),
              child:Center(
                child: Column(
                  children: [
                    Text(
                  "Use your phone to scan the QR code at the machine for fast, secure crediting of your plastic deposits.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/qrcode.png',
                  width: 300,
                  height:300,
                  fit: BoxFit.cover, ),
                  //qrcode download button
                  ElevatedButton(
                    onPressed: () async {
                      //download of the proper QR
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      foregroundColor: AppTheme.primaryWhite,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Download QR Code',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ],
                )
              )
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
