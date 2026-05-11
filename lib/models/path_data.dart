// lib/models/path_data.dart

class PathData {
  final String title;
  final String description;
  final List<String> tags;

  PathData({
    required this.title,
    required this.description,
    required this.tags,
  });
}

// Array of data for the screen (as requested)
final List<PathData> pathOptions = [
  PathData(
    title: 'Frontend Developer',
    description: 'Learn to create user interfaces.',
    tags: ['Javascript', 'Typescript'],
  ),
  PathData(
    title: 'Backend Developer',
    description: 'Server-side development and APIs.',
    tags: ['Python', 'Java', 'Go', 'PHP'],
  ),
  PathData(
    title: 'Full-Stack Developer',
    description: 'Both frontend and backend development.',
    tags: ['Javascript', 'Typescript', 'Python'],
  ),
  PathData(
    title: 'Mobile Developer',
    description: 'Develop iOS and Android applications.',
    tags: ['Swift', 'Kotlin', 'Javascript'],
  ),
];