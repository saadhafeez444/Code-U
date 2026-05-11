import 'package:code_u/models/filter_model.dart';
import 'package:code_u/models/programs_model.dart';
import 'package:code_u/views/lessons/add_programm_filter.dart';
import 'package:code_u/widgets/program_card.dart';
import 'package:flutter/material.dart';



class AddProgramm extends StatefulWidget {
  const AddProgramm({super.key});

  @override
  State<AddProgramm> createState() => _AddProgrammState();
}

class _AddProgrammState extends State<AddProgramm> {
  String selectedCategory = 'All';
FilterState currentFilter = FilterState();

  List<Program> get filteredPrograms {
    List<Program> programs = allPrograms.where((p) {
      bool matchesCategory = selectedCategory == 'All' || p.category == selectedCategory;
      bool matchesUnlocked = !currentFilter.showUnlocked || p.isUnlocked;
      bool matchesActive = !currentFilter.showActive || p.isActive;
      bool matchesClubBased = !currentFilter.includeClubBased || p.isClubBased;
      bool matchesTopic = currentFilter.selectedTopic == null || p.category == currentFilter.selectedTopic;
      bool matchesLevel = currentFilter.selectedLevel == null || p.level == currentFilter.selectedLevel;
      bool matchesFormat = currentFilter.selectedFormat == null || p.format == currentFilter.selectedFormat;

      

      return matchesCategory && matchesUnlocked && matchesActive && matchesClubBased && matchesTopic && matchesLevel && matchesFormat;
    }).toList();
    return programs;
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _onFilterUpdated(FilterState newFilter) {
    setState(() {
      currentFilter = newFilter;
    });
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AddProgrammsFilter(
          initialFilter: currentFilter,
          onApplyFilter: _onFilterUpdated,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.only(top: 30),
         width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome_background.png'),
          fit: BoxFit.fill,
        ),
      ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A2F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Programs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 35),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A2F),
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search, color: Colors.white, size: 24),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _showFilterSheet,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A2F),
                        borderRadius: BorderRadius.circular(50),
                        
                      ),
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  _buildTab('All', 'All'),
                  _buildTab('Frontend', 'Frontend'),
                  _buildTab('Backend', 'Backend'),
                  _buildTab('DevOps', 'DevOps'),
                  _buildTab('Full-Stack', 'Full-Stack'),
                ],
              ),
            ),
            Expanded(
              child: Container(
             
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: filteredPrograms.length,
                  itemBuilder: (context, index) {
                    return ProgramCard(program: filteredPrograms[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, String category) {
    final bool isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () => _onCategorySelected(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00FF7F) : const Color(0xFF1E3A2F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

