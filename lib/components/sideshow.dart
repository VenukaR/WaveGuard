import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:waveguard/config/theme.dart';

class BeachCleanupSlideshow extends StatefulWidget {
  const BeachCleanupSlideshow({super.key});

  @override
  State<BeachCleanupSlideshow> createState() => _BeachCleanupSlideshowState();
}

class _BeachCleanupSlideshowState extends State<BeachCleanupSlideshow> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  // Sample data for the slideshow
  final List<SlideData> _slides = [
    SlideData(
      image: 'assets/images/slide1.png',
      title: 'Keep beaches clean.',
      subtitle: 'Say no the litter,',
      actionText: 'Join us',
    ),
    SlideData(
      image: 'assets/images/slide1.png',
      title: 'Protect our oceans.',
      subtitle: 'Save marine life,',
      actionText: 'Take action',
    ),
    SlideData(
      image: 'assets/images/slide1.png',
      title: 'Save coral reefs.',
      subtitle: 'Preserve biodiversity,',
      actionText: 'Learn more',
    ),
    SlideData(
      image: 'assets/images/slide1.png',
      title: 'Go plastic free.',
      subtitle: 'Reduce, reuse, recycle,',
      actionText: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: _slides.length,
          itemBuilder: (context, index, realIndex) {
            final slide = _slides[index];
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade500,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Background Image with fallback
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade500,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Try to load image, show icon if failed
                          Image.asset(
                            slide.image,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.blue.shade400,
                                child: const Icon(
                                  Icons.waves,
                                  size: 60,
                                  color: Colors.white54,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  // Content
                    Positioned(
                    bottom: 50,
                    left: 50,
                    right: 50,
                    child: Container(
                      width: 250,
                      // height: 20,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        slide.subtitle,
                        style: const TextStyle(
                          color: AppTheme.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                        Text(
                        slide.title,
                        style: const TextStyle(
                          color: AppTheme.primaryWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                        slide.actionText,
                        style: const TextStyle(
                          color: AppTheme.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ],
                      ),
                    ),
                    ),
                  // Slide number indicator
        //           Positioned(
        //             bottom: 0,
        //             right: 15,
        //             child: Container(
        //               padding: const EdgeInsets.symmetric(
        //                 horizontal: 12,
        //                 vertical: 6,
        //               ),
        //               decoration: BoxDecoration(
        //                 color: Colors.black.withOpacity(0.5),
        //                 borderRadius: BorderRadius.circular(15),
        //               ),
        //               child:  Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: _slides.asMap().entries.map((entry) {
        //     int index = entry.key;
        //     return GestureDetector(
        //       onTap: () {
        //         _controller.animateToPage(index);
        //       },
        //       child: Container(
        //         width: _currentIndex == index ? 24 : 8,
        //         height: 8,
        //         margin: const EdgeInsets.symmetric(horizontal: 3),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(4),
        //           color: _currentIndex == index
        //               ? const Color(0xFF4A90E2)
        //               : Colors.grey.shade400,
        //         ),
        //       ),
        //     );
        //   }).toList(),
        // ),
        //             ),
        //           ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            // height: 250,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 15),
        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _slides.asMap().entries.map((entry) {
            int index = entry.key;
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: Container(
                width: _currentIndex == index ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentIndex == index
                      ? const Color(0xFF4A90E2)
                      : Colors.grey.shade400,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Data model for slide content
class SlideData {
  final String image;
  final String title;
  final String subtitle;
  final String actionText;

  SlideData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.actionText,
  });
}
