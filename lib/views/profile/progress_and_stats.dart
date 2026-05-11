import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressAndStats extends StatefulWidget {
  const ProgressAndStats({super.key});

  @override
  State<ProgressAndStats> createState() => _ProgressAndStatsState();
}

class _ProgressAndStatsState extends State<ProgressAndStats> {
  // Data for the bar chart
  final List<double> weeklyLearningHours = [6.0, 7.5, 4.0, 5.5, 8.0, 5.0, 6.5];
  final List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  // Data for Weekly Activity
  final String timeThisWeek = "3h 45m";
  final String streak = "10 days";
  final String bestDay = "Friday (4h)";

  // Data for Skill Mastery (percentages)
  final Map<String, int> skillMastery = {
    "Vocabulary": 80,
    "Listening": 65,
    "Speaking": 72,
    "Grammar": 58,
  };

  // Data for Achievements
  final int xpEarned = 1240;
  final int badgesUnlocked = 5;
  final String clubRank = "Top 12%";

  // Data for Weekly Activity (bottom section)
  final int correctAnswers = 92;
  final int habitsReviewed = 14;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final Color primaryGreen = const Color(0xFF00E676);
    final Color darkBackgroundOverlay = const Color(0xFF0A1F18).withOpacity(0.95);
    final Color cardFillColor = const Color(0xFF0E231F);
    final Color borderColor = Colors.white.withOpacity(0.15);
    final Color secondaryTextColor = Colors.white.withOpacity(0.6);
    final Color lightGreen = const Color(0xFF33D676);
    final Color mediumGreen = const Color(0xFF1ABC9C); // Adjusted to be darker for most bars

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: darkBackgroundOverlay,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02,
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
                          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                     
                     
                      Expanded(
                        child: Text(
                          "Progress & Stats",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Learning Overview",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: cardFillColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: borderColor),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Weekly",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          height: screenHeight * 0.25,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          decoration: BoxDecoration(
                            color: cardFillColor,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: borderColor),
                          ),
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: 10,
                              barTouchData: BarTouchData(enabled: false),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          weekDays[value.toInt()],
                                          style: TextStyle(
                                            color: secondaryTextColor,
                                            fontSize: screenWidth * 0.03,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              barGroups: weeklyLearningHours.asMap().entries.map((entry) {
                                int index = entry.key;
                                double value = entry.value;
                                return BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: value,
                                      color: index == 4 ? primaryGreen : mediumGreen, // Friday is the brightest
                                      width: screenWidth * 0.045,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        _SectionHeader(title: "Weekly Activity", screenWidth: screenWidth),
                        _InfoTile(
                          icon: Icons.calendar_today,
                          label: "This week",
                          value: timeThisWeek,
                          screenWidth: screenWidth,
                        ),
                        _InfoTile(
                          icon: Icons.star_border,
                          label: "Streak",
                          value: streak,
                          screenWidth: screenWidth,
                        ),
                        _InfoTile(
                          icon: Icons.emoji_events_outlined,
                          label: "Best Day",
                          value: bestDay,
                          screenWidth: screenWidth,
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        _SectionHeader(title: "Skill Mastery", screenWidth: screenWidth),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: screenWidth * 0.04,
                            mainAxisSpacing: screenWidth * 0.04,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: skillMastery.length,
                          itemBuilder: (context, index) {
                            String skill = skillMastery.keys.elementAt(index);
                            int percentage = skillMastery.values.elementAt(index);
                            return _SkillMasteryCard(
                              skill: skill,
                              percentage: percentage,
                              screenWidth: screenWidth,
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        _SectionHeader(title: "Achievements", screenWidth: screenWidth),
                        _InfoTile(
                          icon: Icons.emoji_events_outlined,
                          label: "XP earned",
                          value: xpEarned.toString(),
                          screenWidth: screenWidth,
                        ),
                        _InfoTile(
                          icon: Icons.military_tech_outlined,
                          label: "Badges unlocked",
                          value: badgesUnlocked.toString(),
                          screenWidth: screenWidth,
                        ),
                        _InfoTile(
                          icon: Icons.group_outlined,
                          label: "Clubs rank",
                          value: clubRank,
                          screenWidth: screenWidth,
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        _SectionHeader(title: "Weekly activity", screenWidth: screenWidth),
                        _InfoTile(
                          icon: Icons.check_circle_outline,
                          label: "Correct answers",
                          value: "$correctAnswers%",
                          screenWidth: screenWidth,
                        ),
                        _InfoTile(
                          icon: Icons.lightbulb_outline,
                          label: "Habits reviewed",
                          value: habitsReviewed.toString(),
                          screenWidth: screenWidth,
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "View previous activity",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final double screenWidth;

  const _SectionHeader({required this.title, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double screenWidth;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardFillColor = const Color(0xFF0E231F);
    final Color borderColor = Colors.white.withOpacity(0.15);
    final Color secondaryTextColor = Colors.white.withOpacity(0.6);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 18),
      decoration: BoxDecoration(
        color: cardFillColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: screenWidth * 0.06),
          SizedBox(width: screenWidth * 0.04),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: secondaryTextColor,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillMasteryCard extends StatelessWidget {
  final String skill;
  final int percentage;
  final double screenWidth;

  const _SkillMasteryCard({
    required this.skill,
    required this.percentage,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryGreen = const Color(0xFF00E676);
    final Color cardFillColor = const Color(0xFF0E231F);
    final Color borderColor = Colors.white.withOpacity(0.15);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardFillColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            skill,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "$percentage%",
            style: TextStyle(
              color: primaryGreen,
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}