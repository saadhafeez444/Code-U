import 'package:code_u/views/lessons/add_programm.dart';
import 'package:code_u/views/navigation_screen/custom_nav_bar.dart';
import 'package:code_u/views/profile/profile_menu.dart';
import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  static const Color kPrimaryDark = Color(0xFF192F2C);
  static const Color kCardDark = Color(0xFF1F3A37);
  static const Color kAccentGreen = Color(0xFF4DB6AC);
  static const Color kBrightGreen = Color(0xFF32CD32);
  static const Color kLightText = Color(0xFFE0F2F1);
  static const Color kGreyText = Color(0xFF9E9E9E);
  static const Color kWhite = Colors.white;

  final List<String> _tabCategories = [
    'All',
    'Frontend',
    'Backend',
    'Data Science',
    'DevOps',
    'Cloud',
  ];

  final List<Map<String, dynamic>> _lessonData = [
    {
      'type': 'full_stack',
      'title': 'Full-Stack\nFoundations',
      'progress': 0.8,
      'places_occupied': 45,
      'total_places': 50,
      'badge': 42,
      'by': 'Bob Dylan',
    },
    {
      'type': 'mobile_app',
      'title': 'Mobile App Builder',
      'duration': 'in 30 days',
      'by': 'Sam Smith',
      'status': 'Ongoing Course',
      'steps_completed': 4,
      'total_steps': 8,
    },
  ];

  LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark,
      body: Stack(
        children: [
          _buildBackgroundTexture(),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 10),
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        _buildProgramsHeader(context),
                        SizedBox(height: 20),
                        _buildSearchBar(),
                        SizedBox(height: 20),
                        _buildTabs(),
                        SizedBox(height: 20),
                        _buildLessonList(),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // CustomNavBarScreen(),
        ],
      ),
    );
  }

  Widget _buildBackgroundTexture() {
    return Container(
      decoration: BoxDecoration(color: kPrimaryDark),
      child: Center(
        child: CustomPaint(size: Size.infinite, painter: _BackgroundPainter()),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hi, Steve Donovan !',
            style: TextStyle(
              color: kWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileMenu()),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramsHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Programs (5)',
          style: TextStyle(
            color: kWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProgramm()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: kCardDark,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kAccentGreen.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.add, color: kAccentGreen, size: 18),
                SizedBox(width: 4),
                Text(
                  'Add Program',
                  style: TextStyle(color: kAccentGreen, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: kCardDark,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: kGreyText, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Search...',
              style: TextStyle(color: kGreyText.withOpacity(0.8), fontSize: 16),
            ),
          ),
          Icon(Icons.notifications_none, color: kLightText, size: 24),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabCategories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? kBrightGreen : kCardDark.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? null
                    : Border.all(color: kCardDark, width: 1),
              ),
              child: Text(
                _tabCategories[index],
                style: TextStyle(
                  color: isSelected ? kPrimaryDark : kLightText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLessonList() {
    return Column(
      children: _lessonData.map((data) {
        if (data['type'] == 'full_stack') {
          return FullStackCard(data: data);
        }
        return _MobileAppCard(data: data);
      }).toList(),
    );
  }

}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = LessonsScreen.kCardDark.withOpacity(0.08)
      ..strokeWidth = 1.0;

    for (int i = 0; i < size.width; i += 20) {
      canvas.drawLine(
        Offset(i.toDouble(), 0),
        Offset(i.toDouble(), size.height),
        paint,
      );
    }
    for (int i = 0; i < size.height; i += 20) {
      canvas.drawLine(
        Offset(0, i.toDouble()),
        Offset(size.width, i.toDouble()),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FullStackCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const FullStackCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: LessonsScreen.kCardDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff62E267), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'],
                      style: const TextStyle(
                        color: LessonsScreen.kWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    _buildAvatarsAndPlaces(
                      data['places_occupied'],
                      data['total_places'],
                      data['badge'],
                    ),
                  ],
                ),
              ),

              _buildProgressRing(data['progress']),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'By: ${data['by']}',
                style: const TextStyle(
                  color: LessonsScreen.kWhite,
                  fontSize: 18,
                ),
              ),

              _buildIllustration(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imagePath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: LessonsScreen.kCardDark, width: 3),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
    );
  }

  Widget _buildAvatarsAndPlaces(int occupied, int total, int badgeCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$occupied / $total Places',
          style: const TextStyle(color: LessonsScreen.kWhite, fontSize: 15),
        ),
        const SizedBox(height: 20),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: _buildAvatar('assets/images/profile.png'),
                  ),
                  Positioned(
                    left: 25,
                    child: _buildAvatar('assets/images/profile2.png'),
                  ),
                  Positioned(
                    left: 50,
                    child: _buildAvatar('assets/images/profil3.png'),
                  ),
                ],
              ),
            ),
            _buildBadge(badgeCount),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: LessonsScreen.kBrightGreen.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: Text(
        '+$count',
        style: const TextStyle(
          color: LessonsScreen.kCardDark,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProgressRing(double progress) {
    final int percentage = (progress * 100).toInt();

    return Container(
      padding: EdgeInsets.all(10),
      width: 70,
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              backgroundColor: LessonsScreen.kPrimaryDark.withOpacity(0.5),
              valueColor: const AlwaysStoppedAnimation<Color>(
                LessonsScreen.kAccentGreen,
              ),
            ),
          ),

          Text(
            '$percentage %',
            style: const TextStyle(
              color: LessonsScreen.kWhite,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return Image.asset(
      'assets/images/full_stack.png',
      width: 100,
      height: 100,

      fit: BoxFit.fill,
    );
  }
}

final fullStackCardData = {
  'title': 'Full-Stack\nFoundations',
  'places_occupied': 45,
  'total_places': 50,
  'badge': 42,
  'progress': 0.80,
  'by': 'Bob Dylan',
};

class _MobileAppCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const _MobileAppCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: LessonsScreen.kCardDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff62E267), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusChip(data['status']),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: LessonsScreen.kPrimaryDark.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: LessonsScreen.kGreyText,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'By: ${data['by']}',
            style: TextStyle(color: LessonsScreen.kWhite, fontSize: 14),
          ),
          const SizedBox(height: 5),
          Text(
            data['title'],
            style: const TextStyle(
              color: LessonsScreen.kWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data['duration'],
            style: const TextStyle(
              color: LessonsScreen.kGreyText,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          _buildStepProgress(data['steps_completed'], data['total_steps']),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: LessonsScreen.kPrimaryDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(color: LessonsScreen.kAccentGreen, fontSize: 12),
      ),
    );
  }

  Widget _buildStepProgress(int completed, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(total, (index) {
        final isCompleted = index < completed;
        final isLast = index == total - 1;
        final color = isCompleted
            ? LessonsScreen.kBrightGreen
            : LessonsScreen.kPrimaryDark.withOpacity(0.5);

        return Row(
          children: [
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isCompleted
                          ? LessonsScreen.kPrimaryDark
                          : LessonsScreen.kGreyText,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: LessonsScreen.kGreyText,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            if (!isLast)
              Container(
                width: 10,
                height: 2,
                color: LessonsScreen.kPrimaryDark.withOpacity(0.5),
                margin: const EdgeInsets.symmetric(horizontal: 2),
              ),
          ],
        );
      }),
    );
  }
}








 