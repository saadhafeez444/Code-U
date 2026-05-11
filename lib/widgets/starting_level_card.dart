// lib/widgets/starting_level_card.dart

import 'package:code_u/models/level_data_model.dart';
import 'package:flutter/material.dart';


class StartingLevelCard extends StatelessWidget {
  final LevelData level;
  final bool isSelected;
  final VoidCallback onTap;

  // Custom colors matching the dark theme
  static const Color _cardBackground = Color(0xFF0C2417);
  static const Color _brightGreen = Color(0xFF00FF7F);
  static const Color _unselectedBorder = Colors.white24;

  const StartingLevelCard({
    Key? key,
    required this.level,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The border color changes based on the selection state.
    final Color borderColor = isSelected ? _brightGreen : _unselectedBorder;
    
    // The title color changes based on the selection state.
    final Color titleColor = isSelected ? _brightGreen : Colors.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: _cardBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: borderColor,
          width: 2.0, // Thicker border for better visibility of selection
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                level.title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                level.description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}