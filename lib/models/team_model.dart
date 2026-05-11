class Team {
  final String name;
  final String description;
  final List<String> memberImagePaths;
  final int totalMembers;
  final bool isMyTeam;

  Team({
    required this.name,
    required this.description,
    required this.memberImagePaths,
    required this.totalMembers,
    this.isMyTeam = false,
  });
}


final List<Team> myTeamsData = [
  Team(
    name: 'Frontend Developers',
    description:
     
        'A team focused on UI/UX development, animations, and building engaging user interfaces.',
    memberImagePaths: ['assets/images/profile.png', 'assets/images/profile2.png', 'assets/images/profil3.png'],
    totalMembers: 23,
    isMyTeam: true,
  ),
];

final List<Team> discoverTeamsData = [
  Team(
    name: 'Backend Developers',
    description:
        'A team focused on API development, databases, and building robust APIs for scalable systems.',
        memberImagePaths: ['assets/images/profile.png', 'assets/images/profile2.png', 'assets/images/profil3.png'],
    totalMembers: 18,
  ),
  Team(
    name: 'Mobile Developers',
    description:
        'A team focused on building native mobile applications for iOS and Android platforms.',
      memberImagePaths: ['assets/images/profile.png', 'assets/images/profile2.png', 'assets/images/profil3.png'],
    totalMembers: 12,
  ),
];