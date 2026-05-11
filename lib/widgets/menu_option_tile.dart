import 'package:flutter/material.dart';

class MenuOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MenuOptionTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.075,
        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        decoration: BoxDecoration(
          color:  Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            color: Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.arrow_outward_rounded,
              color: Colors.white.withOpacity(0.7),
              size: screenWidth * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}