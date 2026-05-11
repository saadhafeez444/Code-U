// lib/screens/path_screen.dart

import 'package:code_u/models/path_data.dart';
import 'package:code_u/widgets/path_card.dart';
import 'package:flutter/material.dart';


class PathScreen extends StatelessWidget {
  static const String routeName = '/path';

  const PathScreen({super.key});

 
  static const Color _darkGreenColor = Color(0xFF0A1A12);
  static const Color _brightGreenColor = Color(0xFF00FF7F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkGreenColor,
      body: Stack(
        children: [
          // 1. Background Image
          Positioned.fill(
            child: Image.asset(
              // **Ensure this file is in your assets/images folder**
              'assets/images/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),
          // 2. Main Content
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        // AppBar content (Path Title)
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Choose Your Path',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        // Subtitle
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Select your developer role to begin the test',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32.0),
                      ],
                    ),
                  ),
                ),

                // 3. Path Cards from Array Data
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final path = pathOptions[index];
                        return PathCard(
                          path: path,
                          // Placeholder for navigation/action
                          onTap: () {
                            debugPrint('Selected Path: ${path.title}');
                          },
                        );
                      },
                      childCount: pathOptions.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20.0)), // Padding at the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }
}