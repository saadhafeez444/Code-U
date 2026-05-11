// lib/models/practice_level_data.dart

class PracticeLevelData {
  final int id;
  final String title;
  final String description;

  PracticeLevelData({
    required this.id,
    required this.title,
    required this.description,
  });
}

// Array of data for the screen (as requested)
final List<PracticeLevelData> practiceLevelOptions = [
  PracticeLevelData(
    id: 1,
    title: 'It declares a variable that can be reassigned later',
    description: ' It declares a variable that can be reassigned later',
  ),
  PracticeLevelData(
    id: 2,
    title: 'I know a little',
    description: 'It declares a block-scoped variable that cannot be reassigned',
  ),
  PracticeLevelData(
    id: 3,
    title: "I'm a professional",
    description: 'It declares a global variable accessible everywhere',
  ),
  PracticeLevelData(
    id: 4,
    title: "I'm a professional",
    description: 'It declares a function that is constant',
  ),
];