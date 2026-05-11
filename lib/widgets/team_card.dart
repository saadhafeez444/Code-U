
import 'package:code_u/models/team_model.dart';
import 'package:code_u/views/profile/teams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';



class TeamCard extends StatelessWidget {
  final Team team;
  const TeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
  
      decoration: BoxDecoration(
           border: Border.all(color: const Color(0xFF00FF7F).withOpacity(0.5), width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
    
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      if (team.isMyTeam) 
                      Container(
                        height: 30,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text('Active Team', style: TextStyle(color: Colors.white),))
                      ),
                     
                     
       if (team.isMyTeam)              
   Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_outward_rounded, color: Colors.white, size: 20),
                          onPressed: () {}
                        ),
                      ),
                     
                     
                     
                  ],
                ),
               
              if (team.isMyTeam)     SizedBox(height: 10,),
               
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                  team.name,
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
              ],
            ),
            const SizedBox(height: 4),
            Text(
              team.description,
              style:  TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                
                MemberStack(imagePaths: team.memberImagePaths),
                const SizedBox(width: 8),
                
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: kPrimaryGreen.withOpacity(0.2), 
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '+${team.totalMembers} members',
                    style: const TextStyle(
                      color: kPrimaryGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(),
                
                
                if (!team.isMyTeam)
                      Container(
                        height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFF00FF7F).withOpacity(0.5), width: 1.0),
              ),
              child: TextButton.icon(
                
                onPressed: () {},
                icon: const Icon(Icons.add, color: kTextColor, size: 20),
                label: const Text(
                  'Join Team',
                  style: TextStyle(color: kTextColor, fontSize: 14),
                ),
              ),
            ),
         
         
              ],
            ),
          ],
        ),
      ),
    );
  }
}