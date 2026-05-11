import 'package:flutter/material.dart';

// --- Constants for Unified Styling (No minor change allowed) ---
const Color kPrimaryGreen = Color(0xFF5D9D3F);         // Main background green (for context, not used in buttons directly)
const Color kButtonGreen = Color(0xFF23E06F);    
const Color kButtonGrey = Color(0xFF0c382e);        
const Color kButtonBorderGreen = Color(0xFF4CAF50);    // Border color for 'Sign In'
const double kButtonHeight = 56.0;                    // Fixed button height
const double kButtonBorderRadius = 50.0;         
class GreenOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GreenOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      width: double.infinity, // Full width
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent background
          side: const BorderSide(color: kButtonBorderGreen, width: 2), // Green border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonBorderRadius),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}




class GreenFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GreenFilledButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      width: double.infinity, // Full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonGreen, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonBorderRadius),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



class SignUpButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SignUpButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonBorderRadius),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}





class SocialSignInButton extends StatelessWidget {
  final String text;
  final String iconPath; // Requires path to the icon asset
  final VoidCallback onPressed;

  const SocialSignInButton({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      width: double.infinity, // Full width
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: kButtonGrey, // Transparent background
          side: const BorderSide(color: Colors.white54, width: 1), // Light grey border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonBorderRadius),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The icon (e.g., Google or Apple logo)
            Image.asset(
              iconPath,
              height: 24, // Fixed icon size
              width: 24,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}