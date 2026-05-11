
class LeaderboardEntry {
  final int rank;
  final String name;
  final int xp;
  final String imagePath;
  final bool isUser;

  LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.xp,
    required this.imagePath,
    this.isUser = false,
  });
}


final List<LeaderboardEntry> leaderboardData = [
  LeaderboardEntry(rank: 1, name: 'Emily', xp: 13500, imagePath: 'assets/images/profile.png'),
  LeaderboardEntry(rank: 2, name: 'Diana', xp: 12000, imagePath: 'assets/images/profile2.png'),
  LeaderboardEntry(rank: 3, name: 'Anna', xp: 5500, imagePath: 'assets/images/profil3.png'),
  LeaderboardEntry(
      rank: 33, name: 'You', xp: 1500, imagePath: 'assets/images/profile.png', isUser: true),
];

