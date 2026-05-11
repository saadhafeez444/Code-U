import 'package:code_u/models/leaderboard_entry_model.dart';
import 'package:code_u/models/team_model.dart';
import 'package:code_u/widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kDarkBackground = Color(0xFF1B3125);

const Color kBackgroundColor = Color(0xFF1B3A36);
const Color kCardColor = Color(0xFF2C4E4B);
const Color kPrimaryGreen = Color(0xFF5ED988);
const Color kTextColor = Colors.white;
const Color kSecondaryTextColor = Color(0xFFA0A0A0);
const Color kDarkCardColor = Color(0xFF14241C);

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_background.png'),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.04,
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
                        size: 20,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Teams",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            _MyTeamsSection(),
            SizedBox(height: 32),

            // Discover Teams Section
            _DiscoverTeamsSection(),
            SizedBox(height: 32),

            // Leaderboard Section
            LeaderboardSection(),
            SizedBox(height: 48),

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
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => PracticeSecond(),
                                //   ),
                                // );
                              },
                              child: const Text(
                                'Join Random Team',
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
                                'Create Your Own Team',
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
    );
  }
}

class _MyTeamsSection extends StatelessWidget {
  const _MyTeamsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Teams',
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF00FF7F).withOpacity(0.5),
                  width: 1.0,
                ),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: kTextColor, size: 20),
                label: const Text(
                  'Create Team',
                  style: TextStyle(color: kTextColor, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        ...myTeamsData.map((team) => TeamCard(team: team)).toList(),
      ],
    );
  }
}

class _DiscoverTeamsSection extends StatelessWidget {
  const _DiscoverTeamsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Discover Teams',
          style: TextStyle(
            color: kTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const _CategoryButtons(),
        const SizedBox(height: 16),
        // Renders 'Discover Teams' cards using the data array
        ...discoverTeamsData
            .map(
              (team) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TeamCard(team: team),
              ),
            )
            .toList(),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color(0xFF00FF7F).withOpacity(0.5),
              width: 1.0,
            ),
          ),
          child: Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: kTextColor, size: 20),
              label: const Text(
                'Show More',
                style: TextStyle(color: kTextColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryButtons extends StatelessWidget {
  const _CategoryButtons();

  Widget _buildFilterButton(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ?  Color(0xFF5D9D3F) : Colors.transparent,
          side: BorderSide(
            color: isSelected ?  Color(0xFF5D9D3F): kSecondaryTextColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? kTextColor : kSecondaryTextColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterButton('Popular', true),
          _buildFilterButton('New', false),
          _buildFilterButton('For beginners', false),
        ],
      ),
    );
  }
}

class MemberStack extends StatelessWidget {
  final List<String> imagePaths;
  const MemberStack({required this.imagePaths});

  // Size for each profile picture
  static const double avatarSize = 30.0;
  // Overlap amount to create the stack effect
  static const double overlap = 10.0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = imagePaths.asMap().entries.map((entry) {
      int index = entry.key;
      String path = entry.value;

      return Positioned(
        // Position each subsequent circle to the left
        left: index * (avatarSize - overlap),
        child: Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: kCardColor,
              width: 2,
            ), // The card color is used as the visible border color
          ),
          child: CircleAvatar(
            radius: avatarSize / 2,
            backgroundImage: AssetImage(path), // Your asset image
          ),
        ),
      );
    }).toList();

    return SizedBox(
      // The width needs to accommodate all circles with their overlap
      width: (items.length * (avatarSize - overlap)) + overlap,
      height: avatarSize,
      child: Stack(children: items),
    );
  }
}

class LeaderboardSection extends StatelessWidget {
  const LeaderboardSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.transparent, // Background is transparent
        borderRadius: BorderRadius.circular(
          20,
        ), // Reduced border radius slightly
        border: Border.all(
          color: kPrimaryGreen.withOpacity(
            0.5,
          ), // Using kPrimaryGreen for the border
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leaderboard Title
          Center(
            child: const Text(
              'Leaderboard',
              style: TextStyle(
                color: kTextColor,
                fontSize: 22, // Increased font size
                fontWeight: FontWeight.w600, // Slightly less bold
              ),
            ),
          ),
          const SizedBox(height: 4), // Reduced spacing
          // Subtitle
          Center(
            child: const Text(
              'Track your rank, earn badges, and stay motivated',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kSecondaryTextColor,
                fontSize: 13,
              ), // Adjusted size/color
            ),
          ),
          const SizedBox(height: 16),
          // Leaderboard Card
          _LeaderboardCard(data: leaderboardData),
        ],
      ),
    );
  }
}

class _LeaderboardCard extends StatelessWidget {
  final List<LeaderboardEntry> data;
  const _LeaderboardCard({required this.data});

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: [
        // Tabs Row
        Row(
          children: [
            _buildLeaderboardTab('Weekly', true),
            const SizedBox(width: 8),
            _buildLeaderboardTab('Monthly', false),
            const SizedBox(width: 8),
            _buildLeaderboardTab('All-Time', false),
          ],
        ),
        const SizedBox(height: 16),
        // Leaderboard List Items (Un-highlighted items)
        ...data
            .where((entry) => !entry.isUser)
            .map((entry) => _LeaderboardListItem(entry: entry))
            .toList(),

        // Separator before the user's highlighted entry
        if (data.any((entry) => entry.isUser)) const SizedBox(height: 10),

        // User's Leaderboard Item (Highlighted)
        ...data
            .where((entry) => entry.isUser)
            .map((entry) => _LeaderboardListItem(entry: entry))
            .toList(),
      ],
    );
  }

  Widget _buildLeaderboardTab(String text, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          
          color: isSelected ?    Color(0xFF5D9D3F) : Colors.transparent,
          borderRadius: BorderRadius.circular(
            20,
          ),
          border: Border.all(
            
            color: isSelected
                ? Colors.transparent
                : kSecondaryTextColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              // Selected text is white, unselected is secondary text color
              color: isSelected ? Colors.white : kSecondaryTextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _LeaderboardListItem extends StatelessWidget {
  final LeaderboardEntry entry;
  const _LeaderboardListItem({required this.entry});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        width: 1,
        color: Colors.white54,
      )
     ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              '#${entry.rank}',
              style: TextStyle(
             
                color: entry.isUser ? Colors.white : kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          CircleAvatar(
            radius: 20, 
            backgroundImage: AssetImage(entry.imagePath),
            backgroundColor: Colors.grey.shade700, // Fallback background
          ),
          const SizedBox(width: 12),
          Text(
            entry.name,
            style: TextStyle(
              // White text for user, kTextColor for others
              color: entry.isUser ? Colors.white : kTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '${entry.xp} XP',
            style: TextStyle(
              // White text for user, kPrimaryGreen for others
              color: entry.isUser ? Colors.white : kPrimaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterButtons extends StatelessWidget {
  const _FooterButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Join Random Team',
              style: TextStyle(
                color: kCardColor, // Dark text on bright green background
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Or',
          style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryGreen, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Create Your Own Team',
              style: TextStyle(
                color: kPrimaryGreen,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// To run this code, you must place it inside a main function or use a separate file
// For example, in main.dart:
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TeamsPage(),
    );
  }
}
*/
