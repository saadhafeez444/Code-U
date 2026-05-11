class Program {
  final String title;
  final String description;
  final String duration;
  final String modules;
  final String author;
  final String level;
  final String category;
  final String format;
  final bool isUnlocked;
  final bool isActive;
  final bool isClubBased;

  Program({
    required this.title,
    required this.description,
    required this.duration,
    required this.modules,
    required this.author,
    required this.level,
    required this.category,
    required this.format,
    this.isUnlocked = true,
    this.isActive = true,
    this.isClubBased = false,
  });
}

final List<Program> allPrograms = [
  Program(
    title: 'Full-Stack Foundations',
    description: 'Combine frontend and backend skills to create complete web applications.',
    duration: '30 day',
    modules: '10 Moduls',
    author: 'Bob Dylan',
    level: 'Intermediate',
    category: 'Full-Stack',
    format: 'Team Projects',
    isClubBased: true,
  ),
  Program(
    title: 'Frontend Basics',
    description: 'Master HTML, CSS, and JavaScript for stunning user interfaces.',
    duration: '20 day',
    modules: '8 Moduls',
    author: 'Alice Cooper',
    level: 'Beginner',
    category: 'Frontend',
    format: 'Challenge',
    isActive: false,
  ),
  Program(
    title: 'Backend Mastery',
    description: 'Learn server-side programming with Node.js and databases.',
    duration: '45 day',
    modules: '15 Moduls',
    author: 'Charlie Brown',
    level: 'Advanced',
    category: 'Backend',
    format: 'Solo',
  ),
  Program(
    title: 'DevOps Essentials',
    description: 'Understand CI/CD, Docker, and cloud deployments.',
    duration: '15 day',
    modules: '5 Moduls',
    author: 'David Bowie',
    level: 'Intermediate',
    category: 'DevOps',
    format: 'Solo',
    isUnlocked: false,
  ),
  Program(
    title: 'Another Full-Stack',
    description: 'Advanced MERN stack development.',
    duration: '60 day',
    modules: '20 Moduls',
    author: 'Eve Green',
    level: 'Advanced',
    category: 'Full-Stack',
    format: 'Challenge',
    isClubBased: true,
  ),
];