import 'package:code_u/widgets/reusable_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReusableOtpField extends StatelessWidget {
  final TextEditingController? controller;
  final bool autoFocus;

  const ReusableOtpField({
    Key? key,
    this.controller,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65, // Slightly wider to match image aspect ratio
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05), // Very subtle fill
        borderRadius: BorderRadius.circular(18), // Soft rounded corners
        border: Border.all(
          color: Colors.white.withOpacity(0.8), // The thin white border
          width: 1.5,
        ),
      ),
      child: TextFormField(
        controller: controller,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: Colors.white, // Cursor matches the theme
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        // The number style when typed
        style: const TextStyle(
          color: Colors.white, 
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: InputBorder.none, // We use Container for the border visuals
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(bottom: 5), // Align text vertically
          hintText: '0',
          // The placeholder '0' style
          hintStyle: TextStyle(
            color: Color(0xFF8FA39D), // Muted Green/Grey from image
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}