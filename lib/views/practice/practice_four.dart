import 'package:code_u/views/practice/practice_five.dart';
import 'package:code_u/views/practice/practice_third.dart';
import 'package:flutter/material.dart';

class PracticeFour extends StatefulWidget {
  const PracticeFour({super.key});

  @override
  State<PracticeFour> createState() => _PracticeFourState();
}

class _PracticeFourState extends State<PracticeFour> {
  String? _selectedOption;
  bool _isCorrect = false;

  void _handleOptionTap(String option) {
    setState(() {
      _selectedOption = option;
      _isCorrect = (option == 'variable_name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PracticeThird(),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              FractionallySizedBox(
                                widthFactor: 0.1,
                                child: Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00E676),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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


                  const SizedBox(height: 48),
                  const Text(
                    'Use the code snippet below to print\n"Hello World" to the screen.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'variable_name = "Hello World"',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              'print(',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: _selectedOption != null
                                  ? Center(
                                      child: Text(
                                        _selectedOption!,
                                        style: TextStyle(
                                          color: _isCorrect
                                              ? const Color(0xFF00E676)
                                              : const Color(0xFFEF5350),
                                          fontSize: 16,
                                          fontFamily: 'monospace',
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const Text(
                              ')',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: [
                      _buildCodeOption(context, 'Hello World'),
                      _buildCodeOption(context, 'variable_name'),
                      _buildCodeOption(context, '123'),
                      _buildCodeOption(context, 'for'),
                    ],
                  ),
                  const Spacer(),
                  if (_isCorrect)
                    _buildCorrectFeedback(context)
                  else
                    _buildCheckButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeOption(BuildContext context, String text) {
    bool isSelected = (_selectedOption == text);
    Color backgroundColor = Colors.white.withOpacity(0.08);
    Color borderColor = Colors.white.withOpacity(0.15);

    if (isSelected) {
      if (_isCorrect && text == 'variable_name') {
        backgroundColor = const Color(
          0xFF1B5E20,
        ); // Dark Green for correct selection
        borderColor = const Color(
          0xFF4CAF50,
        ); // Green border for correct selection
      } else if (!_isCorrect && text == _selectedOption) {
        backgroundColor = const Color(
          0xFFC62828,
        ); // Dark Red for incorrect selection
        borderColor = const Color(
          0xFFEF5350,
        ); // Red border for incorrect selection
      }
    }

    return GestureDetector(
      onTap: () => _handleOptionTap(text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00E676), Color(0xFF00C853)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {
          // You can add logic here if you want a separate "Check" action
          // before revealing correctness for other options.
          // For this implementation, correctness is determined on tap.
        },
        child: const Text(
          'Check',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCorrectFeedback(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1B5E20), // Dark Green
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF4CAF50)), // Green border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.check_circle, color: Color(0xFF00E676), size: 24),
              SizedBox(width: 8),
              Text(
                'Correct!',
                style: TextStyle(
                  color: Color(0xFF00E676),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'You printed the text using the variable\nname. This is a clean and flexible way to\nmanage output in Python.',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00E676), Color(0xFF00C853)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PracticeFive()),
                );
              },
              child: const Text(
                'Next',
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
    );
  }
}
