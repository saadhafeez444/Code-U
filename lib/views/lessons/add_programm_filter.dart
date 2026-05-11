import 'package:code_u/models/filter_model.dart';
import 'package:flutter/material.dart';

class AddProgrammsFilter extends StatefulWidget {
  final FilterState initialFilter;
  final Function(FilterState) onApplyFilter;

  const AddProgrammsFilter({
    super.key,
    required this.initialFilter,
    required this.onApplyFilter,
  });

  @override
  State<AddProgrammsFilter> createState() => _AddProgrammsFilterState();
}

class _AddProgrammsFilterState extends State<AddProgrammsFilter> {
  late FilterState currentFilter;
  final List<String> topics = ['Frontend', 'Backend', 'Full-Stack'];
  final List<String> levels = ['Beginner', 'Intermediate', 'Advanced'];
  final List<String> formats = ['Solo', 'Team Projects', 'Challenge'];
  final List<String> durations = ['Short (5-10 min)', 'Medium (10-30 min)', 'Long (30+ min)'];

  @override
  void initState() {
    super.initState();
    currentFilter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, scrollController) {
        return Container(
        
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome_background.png'),
          fit: BoxFit.fill,
        ),
         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
        
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Filter Programs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Refine your search to find the right challenge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 20.0, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
           
                      _buildSwitchTile('Show only unlocked', currentFilter.showUnlocked, (value) {
                        setState(() {
                          currentFilter = currentFilter.copyWith(showUnlocked: value);
                        });
                      }),
                      _buildSwitchTile('Show only active programs', currentFilter.showActive, (value) {
                        setState(() {
                          currentFilter = currentFilter.copyWith(showActive: value);
                        });
                      }),
                      _buildSwitchTile('Include club-based programs', currentFilter.includeClubBased, (value) {
                        setState(() {
                          currentFilter = currentFilter.copyWith(includeClubBased: value);
                        });
                      }),
                      const SizedBox(height: 20),
                 
                      _buildFilterSection('Filter by Topics', topics, currentFilter.selectedTopic, (topic) {
                        setState(() {
                          currentFilter = currentFilter.copyWith(selectedTopic: currentFilter.selectedTopic == topic ? null : topic);
                        });
                      }),
                      const SizedBox(height: 20),
                      // --- FILTER BY LEVEL ---
                      _buildFilterSection('Filter by Level', levels, currentFilter.selectedLevel, (level) {
                        setState(() {
                          currentFilter = currentFilter.copyWith(selectedLevel: currentFilter.selectedLevel == level ? null : level);
                        });
                      }),
                      const SizedBox(height: 20),
                      // --- FILTER BY FORMAT ---
                      _buildFilterSection('Filter by Format', formats, currentFilter.selectedFormat, (format) {
                        setState(() {
                          currentFilter = currentFilter.copyWith(selectedFormat: currentFilter.selectedFormat == format ? null : format);
                        });
                      }),
                      const SizedBox(height: 20),
                      // --- DURATION DROPDOWN ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Duration',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E3A2F),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color(0xFF5A7869)),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: currentFilter.selectedDuration ?? durations.first,
                                  dropdownColor: const Color(0xFF1E3A2F),
                                  style: const TextStyle(color: Colors.white),
                                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF00FF7F)),
                                  items: durations.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: const TextStyle(color: Colors.white)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      currentFilter = currentFilter.copyWith(selectedDuration: newValue);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // --- APPLY/CLEAR BUTTONS (Bottom Section) ---
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  color: Color(0xFF0F1B16), // A slightly different background for the fixed footer
                  borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Reset filter state
                          setState(() {
                            currentFilter = FilterState();
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF00FF7F)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text('Clear Filter', style: TextStyle(color: Color(0xFF00FF7F), fontSize: 16)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onApplyFilter(currentFilter);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00FF7F),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shadowColor: Colors.black.withOpacity(0.5),
                          elevation: 5,
                        ),
                        child: const Text('Apply Filter', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSwitchTile(String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xff0c382e),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF00FF7F),
              inactiveThumbColor: const Color(0xFF5A7869),
              inactiveTrackColor: Colors.white.withOpacity(0.2),
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options, String? selectedOption, ValueChanged<String> onSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: options.map((option) {
              final isSelected = selectedOption == option;
              return GestureDetector(
                onTap: () => onSelected(option),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF00FF7F) : const Color(0xFF1E3A2F),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF00FF7F) : const Color(0xFF5A7869),
                      width: 1.0,
                    ),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}