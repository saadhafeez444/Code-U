import 'package:code_u/views/lessons/lessons.dart';
import 'package:code_u/views/profile/accounts_settings.dart';
import 'package:code_u/views/profile/progress_and_stats.dart';
import 'package:code_u/views/profile/teams.dart';
import 'package:flutter/material.dart';

class CustomNavBarScreen extends StatefulWidget {
  @override
  _CustomNavBarScreenState createState() => _CustomNavBarScreenState();
}

class _CustomNavBarScreenState extends State<CustomNavBarScreen> {


  int _selectedIndex = 0;


  final List<Widget> _screens = [
    LessonsScreen(),
    ProgressAndStats(),
    TeamsPage(),
   AccountsAndSettings(),
  ];


  final List<String> _icons = [
    'assets/images/home.png',
    'assets/images/chart.png',
    'assets/images/puzzle.png',
    'assets/images/user.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF051814), 
      body: Stack(
        children: [
    
          _screens[_selectedIndex],

           _buildBottomNavBar(),
         
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 15, top: 10, left: 20, right: 20),
        child: Row(
          children: [
         
            Expanded(
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E38).withOpacity(0.9), // Dark glass color
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2), // The thin glow border
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(0), // Home
                    _buildNavItem(1), // Chart
                    _buildNavItem(2), // Puzzle
                  ],
                ),
              ),
            ),

            SizedBox(width: 15), // The gap between the pill and profile

            // --- SECTION 2: The Profile Squircle ---
            GestureDetector(
              onTap: () => _onItemTapped(3),
              child: Container(
                height: 80,
                width: 80, // Square aspect ratio
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E38).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30), // Squircle shape
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    _icons[3],
                    width: 30,
                    height: 30,
                    color: _selectedIndex == 3 
                        ? Color(0xFF00E676) // Active Color
                        : Colors.white, // Inactive Color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF00E676) : Colors.transparent, // Bright Green
          borderRadius: BorderRadius.circular(25), // Rounded corners for active state
        ),
        padding: EdgeInsets.all(15),
        child: Image.asset(
          _icons[index],
          color: isActive 
              ? Color(0xFF051814) // Dark Icon on Green BG
              : Colors.white,     // White Icon on Dark BG
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}