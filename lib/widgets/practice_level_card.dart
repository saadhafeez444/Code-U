// lib/widgets/practice_level_card.dart

import 'package:flutter/material.dart';
import '../models/practice_level_data.dart';

class PracticeLevelCard extends StatelessWidget {
  final PracticeLevelData level;
  final bool isSelected;
  final VoidCallback onTap;

  // Custom colors matching the dark theme
  static const Color _cardBackground = Color(0xFF0C2417);
  static const Color _brightGreen = Color(0xFF00FF7F);
  static const Color _unselectedBorder = Color(0xFF1E3A2F); // Very subtle dark border

  const PracticeLevelCard({
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
      // The box shadow/elevation is very subtle/non-existent, so we focus on border and color.
      decoration: BoxDecoration(
        color: _cardBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: borderColor,
          width: 2.0, // Slightly thicker border when selected
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
                textAlign: TextAlign.center,
                level.description,
                style: TextStyle(
                  color: Colors.white,
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