import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kFieldBackgroundColor = Color(0xFF0c382e); 
const Color kFieldPlaceholderColor = Colors.white54; 
const Color kFieldLabelColor = Colors.white;       
const Color kFieldTextColor = Colors.white;    
const double kButtonBorderRadius = 14.0;             


class ReusableTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;

  const ReusableTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.isPassword = false, // Default is not password
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: kFieldLabelColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8), // Spacing between label and input field
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isPassword ? TextInputType.text : TextInputType.emailAddress,
          style: const TextStyle(color: kFieldTextColor),
          decoration: InputDecoration(
            // --- Field Styling ---
            filled: true,
            fillColor: kFieldBackgroundColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            
            // --- Border Styling ---
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              borderSide: BorderSide.none, // No visible border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              // Use a slight border color for focus if needed, but keeping none for exact match
              borderSide: BorderSide.none,
            ),

            // --- Text Styling ---
            hintText: hintText,
            hintStyle: TextStyle(color: kFieldPlaceholderColor.withOpacity(0.8)),
          ),
        ),
      ],
    );
  }
}

class ReusablePasswordField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;

  const ReusablePasswordField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  State<ReusablePasswordField> createState() => _ReusablePasswordFieldState();
}

class _ReusablePasswordFieldState extends State<ReusablePasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            color: kFieldLabelColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: const TextStyle(color: kFieldTextColor),
          decoration: InputDecoration(
        
            filled: true,
            fillColor: kFieldBackgroundColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),

   
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              borderSide: BorderSide.none,
            ),

            hintText: widget.hintText,
            hintStyle: TextStyle(color: kFieldPlaceholderColor.withOpacity(0.8)),

            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: kFieldPlaceholderColor, 
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}



