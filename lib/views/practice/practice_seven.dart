
import 'package:code_u/models/practice_level_data.dart';
import 'package:code_u/views/path/starting_level.dart';
import 'package:code_u/widgets/practice_level_card.dart';
import 'package:flutter/material.dart';


class PracticeSeven extends StatefulWidget {
  const PracticeSeven({super.key});

  @override
  State<PracticeSeven> createState() => _PracticeSevenState();
}

class _PracticeSevenState extends State<PracticeSeven> {

  int? _selectedLevelId = practiceLevelOptions.first.id;

  static const Color _darkGreenColor = Color(0xFF0A1A12);
  static const Color _brightGreenColor = Color(0xFF00FF7F);

  void _handleLevelSelected(int id) {
    setState(() {
      _selectedLevelId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: _darkGreenColor,
  body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/welcome_background.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 35.0),

                // ⭐ your back button + progress bar row
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
                              builder: (context) => StartingLevelScreen(),
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

                const SizedBox(height: 20.0),

                Text(
                  'In JavaScript, what does the keyword const mean?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20.0),

                ...practiceLevelOptions.map((level) {
                  return PracticeLevelCard(
                    level: level,
                    isSelected: _selectedLevelId == level.id,
                    onTap: () => _handleLevelSelected(level.id),
                  );
                }).toList(),

                SizedBox(height: 20,)
              ],
            ),
          ),
        ),

       
        Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            builder: (context) => StartingLevelScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Prev',
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
                      onPressed: () {},
                      child: const Text(
                        'Next',
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

        const SizedBox(height: 20),
      ],
    ),
  ),
);

  }
}