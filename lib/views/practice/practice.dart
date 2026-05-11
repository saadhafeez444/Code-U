import 'package:code_u/views/practice/practice_second.dart';
import 'package:code_u/views/profile/profile_menu.dart';
import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileMenu(),
                              ),
                            );
                          },
                        ),
                      ),

                      const Text(
                        'Practice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 32),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF00FF7F).withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Center(
                          child: const Text(
                            'Practice Sessions',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Sharpen your skills in minutes',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        SizedBox(height: 12),
                        _buildPracticeSessionTile(context, 'Quick Drill'),
                        const SizedBox(height: 8),
                        _buildPracticeSessionTile(context, 'Mistake Review'),
                        const SizedBox(height: 8),
                        _buildPracticeSessionTile(context, 'Adaptive Practice'),
                        const SizedBox(height: 8),
                        _buildPracticeSessionTile(context, 'Custom Practice'),
                        const SizedBox(height: 8),
                        _buildPracticeSessionTile(context, 'Challenge Mode'),
                        const SizedBox(height: 22),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  _buildInfoTile(
                    context,
                    'assets/images/thumb_up.png',
                    'Last session',
                    '92% accuracy',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoTile(
                    context,
                    'assets/images/cloud_up.png',
                    'You\'ve improved your skills by',
                    '+12% this week',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoTile(
                    context,
                    'assets/images/timer.png',
                    '3-day practice streak!',
                    '',
                  ),
                  const SizedBox(height: 22),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 17,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF00FF7F).withOpacity(0.5),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
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
                                    builder: (context) => PracticeSecond(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Start Practice',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          const Text(
                            'Or',
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
                                'Continue Last Session',
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
               
               
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeSessionTile(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.arrow_outward_rounded,
              color: Colors.white54,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    String imagePath,
    String title,
    String subtitle,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00FF7F).withOpacity(0.5)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 24, height: 24, color: Colors.white),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
