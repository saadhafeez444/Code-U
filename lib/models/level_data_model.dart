// lib/models/level_data.dart

class LevelData {
  final int id;
  final String title;
  final String description;

  LevelData({
    required this.id,
    required this.title,
    required this.description,
  });
}

// Array of data for the screen (as requested)
final List<LevelData> levelOptions = [
  LevelData(
    id: 1,
    title: 'I want to start from scratch',
    description: 'No prior knowledge, I want to learn step by step.',
  ),
  LevelData(
    id: 2,
    title: 'I know a little',
    description: 'Some basic knowledge, I want to strengthen my skills.',
  ),
  LevelData(
    id: 3,
    title: "I'm a professional",
    description: 'I already have strong experience, just want to test myself.',
  ),
];