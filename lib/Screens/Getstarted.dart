import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waveguard/Screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  final List<_OnboardingData> pages = [
    _OnboardingData(
      image: "assets/images/dolphin.png",
      title: "Discover the Ocean's Wonders",
      description:
          "Explore beautiful marine life and learn how oceans support our planet's balance.",
      waveSvg: "assets/images/v1.svg",
    ),
    _OnboardingData(
      image: "assets/images/clean.png",
      title: "Adopt Greener Habits",
      description:
          "Make small daily changes that reduce waste and protect the sea for future generations.",
      waveSvg: "assets/images/v2.svg",
    ),
    _OnboardingData(
      image: "assets/images/clean2.png",
      title: "Join Hands for Clean Seas",
      description:
          "Take part in local clean-ups and global initiatives to restore our oceans together.",
      waveSvg: "assets/images/v3.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(), // smooth scroll physics
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final page = pages[index];
          return Stack(
            children: [
              /// Background image
              Positioned.fill(
                child: Image.asset(
                  page.image,
                  fit: BoxFit.cover,
                ),
              ),

              /// Overlay with SVG wave + content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      page.waveSvg,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: const Color(0xFF42B0F4),
                      height: MediaQuery.of(context).size.height * 0.45,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            page.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              page.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF006BAE),
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 12),
                            ),
                            onPressed: () {
                              if (_pageIndex < pages.length - 1) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut, // smooth transition
                                );
                              } else {
                                // TODO: Navigate to main app screen
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                                );
                              }
                            },
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                color: Color(0xFF42B0F4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// Page indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              pages.length,
                              (dotIndex) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: _pageIndex == dotIndex ? 16 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _pageIndex == dotIndex
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Skip button
              Positioned(
                top: 50,
                right: 20,
                child: TextButton(
                  onPressed: () {
                    // TODO: skip to last page or main screen
                    _controller.animateToPage(
                      pages.length - 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                    
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OnboardingData {
  final String image;
  final String title;
  final String description;
  final String waveSvg;

  _OnboardingData({
    required this.image,
    required this.title,
    required this.description,
    required this.waveSvg,
  });
}
