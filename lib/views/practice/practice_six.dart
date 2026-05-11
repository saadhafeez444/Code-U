import 'package:code_u/views/practice/practice_five.dart';
import 'package:code_u/views/welcome_screen/welcome_second.dart';
import 'package:flutter/material.dart';

class PracticeSix extends StatelessWidget {
  const PracticeSix({super.key});

  // Custom colors derived from the screenshot
  static const Color primaryGreen = Color(
    0xFF00AA4D,
  ); // Used for buttons, progress bar fill, and overall accent
  static const Color darkBackgroundGreen = Color(
    0xFF144D29,
  ); // The dark green color used in the screenshot
  static const Color lightText = Colors.white; // Text color
  static const Color subtleText = Color(
    0xFF99C2AA,
  ); // Used for "Congratulations..." text

  // Data for the 'What You Learned' section
  final List<String> learnedItems = const [
    'Variable Definition',
    'Conditional Statements (if/else)',
    'Simple Loops (for)',
  ];

  // Widget for the 'What You Learned in This Lesson' card
  Widget _buildLearnedItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/check_icon.png', width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: lightText,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the main content card
  Widget _buildContentCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), // Specified border radius
        border: Border.all(
          color: primaryGreen.withOpacity(0.5), // Subtle border
          width: 1.0,
        ),
      ),
      child: child,
    );
  }

  // Widget for the progress bar
  Widget _buildProgressBar() {
    const double progress = 0.8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total XP: 4650 XP',
              style: TextStyle(
                color: lightText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '+150 XP',
              style: TextStyle(
                color: primaryGreen,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            10,
          ), // Rounded corners for the bar
          child: LinearProgressIndicator(
            value: progress, // Current progress
            backgroundColor: darkBackgroundGreen.withOpacity(
              0.8,
            ), // Background bar color
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFF5D9D3F),
            ), // Progress fill color
            minHeight: 10,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for padding/sizing
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                    vertical: 17.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Navigation line retained but uses the dummy class
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PracticeFive(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
             
             
                Center(
                  child: SizedBox(
                    height: 138,
                    width: 138, // Approximate size
                    child: Image.asset(
                      // This placeholder image is a close match to the vibe
                      'assets/images/account_create.png',
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.psychology,
                        color: primaryGreen,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Main Title
                const Text(
                  "You've completed the lesson!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightText,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),

                // 4. Subtitle
                const Text(
                  "Congratulations, you did a great job!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),

                // 5. XP Progress Bar
                _buildProgressBar(),
                const SizedBox(height: 30),

                // 6. What You Learned Card
                _buildContentCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What You Learned in This Lesson',
                        style: TextStyle(
                          color: lightText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...learnedItems
                          .map((item) => _buildLearnedItem(item))
                          .toList(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.11,
                ), // Spacer to push buttons down

                Container(
                  width: double.infinity,
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
                          builder: (context) => WelcomeSecond(),
                        ),
                      );
                    },
                    child: const Text(
                      'Next Lesson',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFF00FF7F).withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Return to Lessons',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
