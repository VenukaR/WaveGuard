import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waveguard/Screens/Community.dart';
import 'package:waveguard/config/theme.dart';
import 'Screens/Home.dart';
import 'Screens/Quiz.dart';
import 'Screens/Learn.dart';
import 'Screens/Profile.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    //task
    const Quiz(),
    //community
    const Community(),
    //learn
  const Learn(),
    //profile

  
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppTheme.primaryWhite,
          unselectedItemColor: AppTheme.primaryWhite.withOpacity(0.7),
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
            items: [
            BottomNavigationBarItem(
              icon: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryWhite.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ),
              activeIcon: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.primaryWhite,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 2),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: ColorFilter.mode(
                      AppTheme.primaryWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/icons/task.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryWhite.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ),
              activeIcon: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.primaryWhite,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 2),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    'assets/icons/task.svg',
                    colorFilter: ColorFilter.mode(
                      AppTheme.primaryWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/icons/community.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryWhite.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ),
              activeIcon: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.primaryWhite,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 2),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    'assets/icons/community.svg',
                    colorFilter: ColorFilter.mode(
                      AppTheme.primaryWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/icons/learn.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryWhite.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ),
              activeIcon: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.primaryWhite,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 2),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    'assets/icons/learn.svg',
                    colorFilter: ColorFilter.mode(
                      AppTheme.primaryWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryWhite.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ),
              activeIcon: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.primaryWhite,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 2),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    colorFilter: ColorFilter.mode(
                      AppTheme.primaryWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}