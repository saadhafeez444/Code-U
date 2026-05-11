class FilterState {
  bool showUnlocked = false;
  bool showActive = false;
  bool includeClubBased = false;
  String? selectedTopic;
  String? selectedLevel;
  String? selectedFormat;
  String? selectedDuration;

  FilterState copyWith({
    bool? showUnlocked,
    bool? showActive,
    bool? includeClubBased,
    String? selectedTopic,
    String? selectedLevel,
    String? selectedFormat,
    String? selectedDuration,
  }) {
    return FilterState()
      ..showUnlocked = showUnlocked ?? this.showUnlocked
      ..showActive = showActive ?? this.showActive
      ..includeClubBased = includeClubBased ?? this.includeClubBased
      ..selectedTopic = selectedTopic ?? this.selectedTopic
      ..selectedLevel = selectedLevel ?? this.selectedLevel
      ..selectedFormat = selectedFormat ?? this.selectedFormat
      ..selectedDuration = selectedDuration ?? this.selectedDuration;
  }
}