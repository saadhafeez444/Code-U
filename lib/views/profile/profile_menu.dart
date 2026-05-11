import 'package:code_u/views/lessons/lessons.dart';
import 'package:code_u/views/profile/accounts_settings.dart';
import 'package:code_u/views/practice/practice.dart';
import 'package:code_u/views/profile/progress_and_stats.dart';
import 'package:code_u/views/profile/subscription.dart';
import 'package:code_u/views/profile/teams.dart';
import 'package:code_u/widgets/menu_option_tile.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final TextStyle standardTextStyle = TextStyle(
      color: Colors.white,
      fontSize: screenWidth * 0.045,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_background.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0A1F18).withOpacity(0.85),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.04,
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: 
                        (context) => LessonsScreen()));
                        },
                      ),
                    ),
                
                
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        MenuOptionTile(
                          title: "Account & Settings",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountsAndSettings(),
                              ),
                            );
                          },
                        ),
                        MenuOptionTile(
                          title: "Progress & Stats",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProgressAndStats(),
                              ),
                            );
                          },
                        ),
                        MenuOptionTile(
                          title: "Practice",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Practice(),
                              ),
                            );
                          },
                        ),
                        MenuOptionTile(
                          title: "Teams",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeamsPage(),
                              ),
                            );
                          },
                        ),
                        MenuOptionTile(
                          title: "Subscription",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Subscription(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: screenHeight * 0.04,
                      top: screenHeight * 0.02,
                    ),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.075,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2C26),
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.05),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Log Out", style: standardTextStyle),
                          Icon(
                            Icons.exit_to_app_rounded,
                            color: Colors.white.withOpacity(0.7),
                            size: screenWidth * 0.06,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
