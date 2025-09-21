import 'package:flutter/material.dart';
import 'package:waveguard/Screens/LoginSignUp/Getstarted.dart';
import 'package:waveguard/main_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController _logoController;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  bool newUser = false; 

  bool _showFullLogo = false;
  bool _showProgressBar = false;

  @override
  void initState() {
    super.initState();

    // Controls logo move + scale animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Controls progress bar animation
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation =
        Tween<double>(begin: 0, end: 1).animate(_progressController);

    _startSequence();
  }

  Future<void> _startSequence() async {

  // Step 1: Show logo 1 for 1s
  await Future.delayed(const Duration(seconds: 1));

  // Step 2: Animate logo upward + shrink + elevate
  _logoController.forward();

  // Step 3: After animation, show progress bar
  await Future.delayed(const Duration(milliseconds: 800));
  setState(() => _showProgressBar = true);

  // Step 4: Start progress bar
  _progressController.forward();

  // Step 5: After 3s, swap to logo2
  await Future.delayed(const Duration(seconds: 3));
  setState(() => _showFullLogo = true);

    // Step 5: Navigate (optional)
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      if(newUser){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainNavigation()),
        );
      }
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF42B0F4),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: !_showFullLogo
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo 1 (slides up + scales down + shadow)
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(0, -0.2),
                        ).animate(
                          CurvedAnimation(
                            parent: _logoController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 1.0,
                            end: 0.7,
                          ).animate(
                            CurvedAnimation(
                              parent: _logoController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: Material(
                            // elevation: 16,
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.transparent,
                            child: Image.asset(
                              "assets/images/logo1.png",
                              width: size.width * 0.6,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Progress bar (only visible after logo animates)
                      if (_showProgressBar)
                        SizedBox(
                          width: size.width * 0.5,
                          child: AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, child) {
                              return LinearProgressIndicator(
                                value: _progressAnimation.value,
                                color: Colors.white,
                                backgroundColor: Colors.white.withOpacity(0.3),
                                minHeight: 6,
                              );
                            },
                          ),
                        ),
                    ],
                  )
                : FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _logoController,
                      curve: Curves.easeInOut,
                    ),
                    child: Image.asset(
                      "assets/images/logo2.png",
                      width: size.width * 0.9,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
