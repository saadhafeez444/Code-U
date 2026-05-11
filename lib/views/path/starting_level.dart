import 'package:code_u/models/level_data_model.dart';
import 'package:code_u/views/practice/practice_seven.dart';
import 'package:code_u/widgets/reusable_buttons.dart';
import 'package:code_u/widgets/starting_level_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartingLevelScreen extends StatefulWidget {
  const StartingLevelScreen({super.key});

  @override
  State<StartingLevelScreen> createState() => _StartingLevelScreenState();
}

class _StartingLevelScreenState extends State<StartingLevelScreen> {
  int? _selectedLevelId = levelOptions.first.id;

  static const Color _darkGreenColor = Color(0xFF0A1A12);
  static const Color _brightGreenColor = Color(0xFF00FF7F);

  void _handleLevelSelected(int id) {
    setState(() {
      _selectedLevelId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _darkGreenColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 24.0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 15),
                      Center(
                        child: Image.asset(
                          'assets/images/welcome.png',
                          fit: BoxFit.contain,
                          width: 170,
                          height: 170,
                        ),
                      ),
                      SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Choose your starting level',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),

                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Select how much experience you already have',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                    ]),
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final level = levelOptions[index];
                      return StartingLevelCard(
                        level: level,
                        isSelected: _selectedLevelId == level.id,
                        onTap: () => _handleLevelSelected(level.id),
                      );
                    }, childCount: levelOptions.length),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: SliverToBoxAdapter(
                    child: GreenFilledButton(
                      text: 'Start Testing',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PracticeSeven(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
