import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;
  const TagChip({
    Key? key,
    required this.label,
  }) : super(key: key);
    
    
   
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
           color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30.0),
        
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}