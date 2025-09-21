import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

final List<String> imageList = [
"assets/images/slide1.png",
"assets/images/slide2.png",
"assets/images/slide3.png",
];

class SlideWidget extends StatefulWidget {
  const SlideWidget({super.key});

  @override
  _SlideWidgetState createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  int currentIndex = 0;
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted) return;
      int nextPage = (currentIndex + 1) % imageList.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentIndex = nextPage;
      });
      _startAutoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              child: ClipRRect(
                // borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: PageView.builder(
                    itemCount: imageList.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                        // width: double.infinity,
                        // height: 200,
                      );
                    },
                  ),
                ),
              ),
            ),
            // Dot indicator inside the image at the bottom center
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imageList.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 18 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? Colors.white : Colors.white54,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        if (currentIndex == index)
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
