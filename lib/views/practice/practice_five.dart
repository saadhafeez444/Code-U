import 'package:code_u/views/practice/practice_four.dart';
import 'package:code_u/views/practice/practice_six.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PracticeFive extends StatefulWidget {
  const PracticeFive({super.key});

  @override
  State<PracticeFive> createState() => _PracticeFiveState();
}

class _PracticeFiveState extends State<PracticeFive> {
  String _printedOutput = '';
  final String _variableName = "Hello World";
  final TextEditingController _codeController = TextEditingController();

  void _runCode() {
    if (_codeController.text.trim() == 'variable_name') {
      setState(() {
        _printedOutput = _variableName;
      });
    } else {
      setState(() {
        _printedOutput = _codeController.text;
      });
    }
  }

  // Define the exact colors based on the screenshot
  static const Color _darkGreen = Color(0xFF0D331B);
  static const Color _mediumGreen = Color(0xFF145229);
  static const Color _lightGreen = Color(0xFF32C747);
  static const Color _outlineColor = Color(0xFF1B6A35);
  static const Color _progressBarColor = Color(
    0xFF00E676,
  ); // Used in your progress bar

  @override
  Widget build(BuildContext context) {
    // Set status bar icons to light
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );

    return Scaffold(
      backgroundColor: _darkGreen, // Fallback color for the background
      // Important for background image to extend behind the status bar
      extendBodyBehindAppBar: true,

      // Use Stack to layer the image behind the content
      body: Stack(
        children: [
          // 1. Background Image (Placeholder asset name retained)
          Positioned.fill(
            child: Image.asset(
              // NOTE: This asset 'assets/images/welcome_background.png' must exist in your project
              'assets/images/welcome_background.png',
              fit: BoxFit.cover, // Ensures the image covers the whole screen
            ),
          ),

          // 2. Main Content
          // SafeArea ensures content starts below the notch/status bar
          SafeArea(
            child: Column(
              // Main Column is constrained by SafeArea
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Top Bar (Close Icon & Progress) - Fixed height content
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Close Icon
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            // Navigation line retained but uses the dummy class
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PracticeFour(),
                              ),
                            );
                          },
                        ),
                      ),

                      // Progress Bar
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: 0.1, // 1/10th progress
                              backgroundColor: Colors.white.withOpacity(0.1),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                _progressBarColor,
                              ),
                              minHeight: 8,
                            ),
                          ),
                        ),
                      ),

                      // Question Counter
                      const Text(
                        '01/10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // **FIX: SingleChildScrollView wrapped in Expanded to allow scrolling**
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 2. Question Text
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Use the code snippet below to print "Hello World" to the screen.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // 3. Code Snippet Area
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          // **FIX: Explicit height constraint on the outer Container**
                          // This is crucial for the nested 'Expanded' TextFild to work.
                          child: Container(
                            height:
                                250, // Adjusted height for better fit, customize as needed
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: _mediumGreen,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Variable declaration
                                Row(
                                  children: [
                                    const Text(
                                      'variable_name = ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                    Text(
                                      '"$_variableName"',
                                      style: const TextStyle(
                                        color: _lightGreen,
                                        fontSize: 13,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                      15,
                                      10,
                                      10,
                                      10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _outlineColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'print(',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'monospace',
                                              ),
                                            ),
                                            Expanded(
                                              // Allows TextField to fill remaining space
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10.0,
                                                ),
                                                child: TextField(
                                                  controller: _codeController,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: null,
                                                  decoration:
                                                      const InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: 'monospace',
                                                  ),
                                                  cursorColor: _lightGreen,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              ')',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'monospace',
                                              ),
                                            ),
                                          ],
                                        ),

                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 45,
                                            height: 45,
                                            decoration: const BoxDecoration(
                                              color: _outlineColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.undo,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 4. Printed Output (simulated console)
                        if (_printedOutput.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Output:\n$_printedOutput',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                Padding(
                
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white70, width: 1.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color(0xFF00FF7F).withOpacity(0.5),
                                width: 1.0,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticeSix(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Hint',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF5D9D3F),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticeFour(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Run Code',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
